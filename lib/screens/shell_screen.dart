import 'package:flutter/material.dart';
import 'package:youtube_app/navigation/bottom_navigator.dart';
import 'package:youtube_app/screens/home_screen.dart';
import 'package:youtube_app/screens/perfil_screen.dart';
import 'package:youtube_app/screens/notifications_screen.dart';
import 'package:youtube_app/screens/subscriptions_screen.dart';
import 'package:youtube_app/widgets/appbar_widget.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    SubscriptionsScreen(),
    NotificationsScreen(),
    PerfilScreen()
  ];

  void navigate(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      bottomNavigationBar: BottomNavigator(currentIndex: currentIndex, onTap: navigate,),
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: _pages,
        ),
      ),
    );
  }
}