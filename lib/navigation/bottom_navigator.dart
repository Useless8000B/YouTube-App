import 'package:flutter/material.dart';
import 'package:youtube_app/colors.dart';

class BottomNavigator extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const BottomNavigator({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: AppColors.black,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.all(TextStyle(fontSize: 10.5)),
      height: 60,
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: [
        const NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: "Home",
        ),

       const NavigationDestination(
          icon: Icon(Icons.subscriptions_outlined),
          selectedIcon: Icon(Icons.subscriptions),
          label: "Subscriptions",
        ),

        const NavigationDestination(
          icon: Icon(Icons.notifications_outlined, size: 28,),
          selectedIcon: Icon(Icons.notifications),
          label: "Notifications",
        ),

        NavigationDestination(
          icon: _buildAvatarIcon('U', isSelected: false),
          selectedIcon: _buildAvatarIcon('U', isSelected: true),
          label: "You",
        ),
      ],
    );
  }

  Widget _buildAvatarIcon(String label, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: Colors.deepPurple,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
