import 'package:flutter/material.dart';
import 'package:task_master/features/splash/ui/splash_screen.dart';
import 'package:task_master/widgets/theme/theme.dart';

class ApplicationClass extends StatelessWidget {
  const ApplicationClass({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: TMAppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
