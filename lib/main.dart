import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Mytheme currentTheme = new Mytheme();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTheme.addListener(() {
      print("clicked");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dark Theme tutorial",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: HomePage(),
    );
  }
}
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello World!"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          currentTheme.switchMode();
        },
        label: Text("Switch Themes"),
        icon: Icon(Icons.brightness_7_sharp),
      ),
    );
  }
}

class Mytheme with ChangeNotifier {
  static bool _isDark = false;
  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchMode() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
