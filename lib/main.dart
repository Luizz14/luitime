import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luitime/app.dart';
import 'package:luitime/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.initialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const App());
  });
}
