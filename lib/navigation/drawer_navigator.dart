import 'package:flutter/material.dart';

class DrawerNavigator extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const DrawerNavigator({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      children: const [
        NavigationDrawerDestination(
          icon: Icon(Icons.home_filled),
          label: Text("Home"),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.video_collection),
          label: Text("Shorts"),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.subscriptions),
          label: Text("Subscriptions"),
        ),
        Divider(),
      ],
    );
  }
}
