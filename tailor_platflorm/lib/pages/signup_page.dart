import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';

// redirection pour signup tailleur
import 'catalogue_page.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback? onSignupSuccess;
  const SignupPage({super.key, this.onSignupSuccess});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _pseudoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nomTailleurController = TextEditingController();
  final _localisationController = TextEditingController();
  final _authService = AuthService();
  UserRole _role = UserRole.client;
  bool _loading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      await _authService.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        pseudo: _pseudoController.text.trim(),
        role: _role,
        nomTailleur: _role == UserRole.tailleur
            ? _nomTailleurController.text.trim()
            : null,
        localisationTailleur: _role == UserRole.tailleur
            ? _localisationController.text.trim()
            : null,
      );
      // gestion de l'inscription
      if (!mounted) return;
      if (widget.onSignupSuccess != null) {
        widget.onSignupSuccess!();
      } else if (_role == UserRole.tailleur) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const CataloguePage()),
        );
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Inscription impossible : $e')));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inscription')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.sand),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SegmentedButton<UserRole>(
                    segments: const [
                      ButtonSegment(
                        value: UserRole.client,
                        label: Text('Client'),
                      ),
                      ButtonSegment(
                        value: UserRole.tailleur,
                        label: Text('Tailleur'),
                      ),
                    ],
                    selected: {_role},
                    onSelectionChanged: (s) => setState(() => _role = s.first),
                    style: SegmentedButton.styleFrom(
                      selectedBackgroundColor: AppColors.terracotta,
                      selectedForegroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    controller: _pseudoController,
                    decoration: const InputDecoration(labelText: 'Pseudo'),
                    validator: (v) =>
                        (v == null || v.isEmpty) ? 'Requis' : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (v) => (v == null || !v.contains('@'))
                        ? 'Email invalide'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Mot de passe',
                    ),
                    validator: (v) => (v == null || v.length < 6)
                        ? 'Minimum 6 caractères'
                        : null,
                  ),
                  if (_role == UserRole.tailleur) ...[
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _nomTailleurController,
                      decoration: const InputDecoration(
                        labelText: "Nom de l'atelier",
                      ),
                      validator: (v) =>
                          (v == null || v.isEmpty) ? 'Requis' : null,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _localisationController,
                      decoration: const InputDecoration(
                        labelText: 'Localisation',
                      ),
                      validator: (v) =>
                          (v == null || v.isEmpty) ? 'Requis' : null,
                    ),
                  ],
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _submit,
                      child: _loading
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text("S'inscrire"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
