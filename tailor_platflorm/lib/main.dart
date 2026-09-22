import 'package:flutter/material.dart';
import 'package:tailor_platflorm/pages/home_page.dart';
//import 'pages/tailor_profile_page.dart';

//22/09/2026
import 'theme/app_theme.dart';

//firebase offline
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kDebugMode) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099, automaticHostMapping: false);
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080, automaticHostMapping: false);
  }

  runApp(const TailorPlatformApp());
}

class TailorPlatformApp extends StatelessWidget {
  const TailorPlatformApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Tailor platform', theme: AppTheme.theme, home: const HomePage());
  }
}
