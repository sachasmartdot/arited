import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tailor_platflorm/data/mock_data.dart';
import 'package:tailor_platflorm/models/realisation.dart';
import 'package:tailor_platflorm/theme/app_theme.dart';

class AddArticlePage extends StatefulWidget {
  const AddArticlePage({super.key});

  @override
  State<AddArticlePage> createState() => _AddArticlePageState();
}

class _AddArticlePageState extends State<AddArticlePage> {
  final nomController = TextEditingController();
  final desController = TextEditingController();
  final prixController = TextEditingController();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (picked != null) setState(() => _selectedImage = File(picked.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un article')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.warm,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.sand),
                  image: _selectedImage != null
                      ? DecorationImage(
                          image: FileImage(_selectedImage!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _selectedImage == null
                    ? const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              color: AppColors.stone,
                              size: 32,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Ajouter une photo',
                              style: TextStyle(color: AppColors.stone),
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nomController,
              decoration: const InputDecoration(labelText: 'Nom du modèle'),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: desController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: prixController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Prix du modèle'),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (nomController.text.isEmpty || prixController.text.isEmpty)
                    return;
                  mockRealisations.add(
                    Realisation(
                      image: _selectedImage?.path ?? '',
                      title: nomController.text,
                      description: desController.text,
                      price: double.tryParse(prixController.text) ?? 0,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Ajouter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
