import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanymtest_app/firebase_options.dart';
import 'package:tanymtest_app/src/features/history/result/result_provider.dart';
import 'package:tanymtest_app/src/features/login/provider/auth_service.dart';
import 'package:tanymtest_app/src/features/tests/ui/quiz/provider/test_provider.dart';
import 'package:tanymtest_app/src/services/auth_service/auth_gate.dart';

import 'src/features/profile/meet/provider/psychologist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseProvider()),
        ChangeNotifierProvider(create: (context) => QuizProvider(context)),
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ResultProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
