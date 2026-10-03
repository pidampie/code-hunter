import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Mengunci orientasi ke Landscape sesuai desain PRD Code Hunter
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const CodeHunterApp());
}

class CodeHunterApp extends StatelessWidget {
  const CodeHunterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Hunter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF5F7F8)),
      home: const LandingPage(),
    );
  }
}
