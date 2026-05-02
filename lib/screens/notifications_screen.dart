import 'package:flutter/material.dart';
import 'package:youtube_app/colors.dart';
import 'package:youtube_app/models/video_model.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<VideoModel> notifications = [
      VideoModel(
        thumbnail: 'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?w=200',
        title: 'Flutter Master enviou: How to create flutter apps in 2026',
        channelName: 'Flutter Master',
        views: '', 
        postedTime: '2 hours ago',
        channelAvatar: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.icon-icons.com%2Ficons2%2F2108%2FPNG%2F512%2Fflutter_icon_130936.png',
      ),
      VideoModel(
        thumbnail: 'https://plus.unsplash.com/premium_photo-1676496046182-356a6a0ed002?w=200',
        title: 'Fireship enviou: Look mom, we got some videos',
        channelName: 'Fireship',
        views: '',
        postedTime: '1 day ago',
        channelAvatar: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn-1.webcatalog.io%2Fcatalog%2Ffireship%2Ffireship-icon-filled-256.png',
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          _buildFilterChips(),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return _NotificationTile(notification: notifications[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Mentions'];
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Chip(
              label: Text(filters[index]),
              backgroundColor: index == 0 ? AppColors.white : AppColors.black,
              labelStyle: TextStyle(color: index == 0 ? AppColors.black : AppColors.white),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          );
        },
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final VideoModel notification;
  const _NotificationTile({required this.notification});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(notification.channelAvatar),
            ),
            const SizedBox(width: 16),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: const TextStyle(fontSize: 14, height: 1.3),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.postedTime,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 8),

            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                notification.thumbnail,
                width: 64,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
            
            const Icon(Icons.more_vert, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}