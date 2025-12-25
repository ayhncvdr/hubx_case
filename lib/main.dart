import 'package:flutter/material.dart';
import 'package:hubx_case/app.dart';
import 'package:hubx_case/core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(const App());
}
