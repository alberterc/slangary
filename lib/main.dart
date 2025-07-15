import 'package:flutter/material.dart';
import 'package:slangary/routes/routes.dart';
import 'package:slangary/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SlangaryApp());
}

class SlangaryApp extends StatelessWidget {
  const SlangaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = theme(
        const Color.fromRGBO(247, 213, 158, 1.0), Brightness.light, false);
    final darkTheme =
        theme(const Color.fromRGBO(247, 213, 158, 1.0), Brightness.dark, false);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Slangary',
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
