import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_master/features/authentications/providers/authentication_provider.dart';
import 'package:task_master/features/home/ui/home_screen.dart';
import 'package:task_master/features/splash/ui/splash_screen.dart';
import 'package:task_master/widgets/theme/theme.dart';

class ApplicationClass extends StatelessWidget {
  const ApplicationClass({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ItemProvider()),
        ChangeNotifierProvider(create: (_)=>AuthenticationProviders()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: TMAppTheme.darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
class ItemProvider extends ChangeNotifier {
  List<String> items = [];

  void addItem(String item) {
    items.add(item);
    notifyListeners();
  }
}