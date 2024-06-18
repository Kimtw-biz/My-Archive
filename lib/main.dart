import 'package:flutter/material.dart';

import 'bootstrap.dart';
import 'cores/services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseService.initialize();

  runApp(const Bootstrap());
}
