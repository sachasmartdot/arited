import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum UserRole { client, tailleur }

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<String> signUp({
    required String email,
    required String password,
    required String pseudo,
    required UserRole role,
    String? nomTailleur,
    String? localisationTailleur,
  }) async {
    final credential =
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final uid = credential.user!.uid;

    await _db.collection('utilisateurs').doc(uid).set({
      'role': role.name,
      'pseudo': pseudo,
    });

    if (role == UserRole.tailleur) {
      await _db.collection('tailleurs').doc(uid).set({
        'nomTailleur': nomTailleur,
        'localisationTailleur': localisationTailleur,
      });
    }
    return uid;
  }

  Future<Map<String, dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    final credential =
        await _auth.signInWithEmailAndPassword(email: email, password: password);
    final doc = await _db.collection('utilisateurs').doc(credential.user!.uid).get();
    return doc.data() ?? {};
  }

  Future<void> signOut() => _auth.signOut();
}
