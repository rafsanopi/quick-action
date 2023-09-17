import 'package:flutter/material.dart';
import 'package:quick_action/screens/event.dart';
import 'package:quick_action/screens/profile.dart';
import 'package:quick_action/screens/search.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final QuickActions quickActions = const QuickActions();

  void action() {
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'profile', localizedTitle: 'Profile', icon: 'profile'),
      const ShortcutItem(
          type: 'search', localizedTitle: 'Search', icon: 'search'),
      const ShortcutItem(type: 'event', localizedTitle: 'Event', icon: 'event'),
    ]);
    //
    //
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'profile') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileUI(),
            ));
      } else if (shortcutType == 'search') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchUI(),
            ));
      } else if (shortcutType == 'event') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EventUI(),
            ));
      }
      // More handling code...
    });
  }

  @override
  void initState() {
    action();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          'Close and hold the app for Quick Action',
        ),
      ),
    );
  }
}
