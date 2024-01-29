import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:introduce_your_city_task/firebase_options.dart';

@immutable
class ApplicationStart{
  const ApplicationStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

