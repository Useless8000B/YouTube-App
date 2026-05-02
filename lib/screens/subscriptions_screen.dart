import 'package:flutter/material.dart';
import 'package:youtube_app/colors.dart';
import 'package:youtube_app/models/video_model.dart';

class SubscriptionsScreen extends StatelessWidget {
  const SubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<VideoModel> videos = [
      VideoModel(
        thumbnail: 'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?w=500&auto=format&fit=crop&q=60',
        title: 'How to create flutter apps in 2026',
        channelName: 'Flutter Master',
        views: '150K views',
        postedTime: '2 hours ago',
        channelAvatar: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.icon-icons.com%2Ficons2%2F2108%2FPNG%2F512%2Fflutter_icon_130936.png',
      ),
      VideoModel(
        thumbnail: 'https://plus.unsplash.com/premium_photo-1676496046182-356a6a0ed002?w=500&auto=format&fit=crop&q=60',
        title: 'Look mom, we got some videos',
        channelName: 'Fireship',
        views: '45K views',
        postedTime: '1 day ago',
        channelAvatar: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn-1.webcatalog.io%2Fcatalog%2Ffireship%2Ffireship-icon-filled-256.png',
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildChannelList(),
                const Divider(height: 1),
                _buildFilterChips(),
              ],
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final video = videos[index];
                return _VideoTile(video: video);
              },
              childCount: videos.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChannelList() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=sub$index'),
                ),
                const SizedBox(height: 6),
                const Text('Channel', style: TextStyle(fontSize: 11)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Today', 'Continue watching', 'Unwatched', 'Live'];
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Chip(
              label: Text(filters[index]),
              backgroundColor: index == 0 ? AppColors.white : AppColors.black,
              labelStyle: TextStyle(
                color: index == 0 ? AppColors.black : AppColors.white,
                fontSize: 13,
              ),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          );
        },
      ),
    );
  }
}

class _VideoTile extends StatelessWidget {
  final VideoModel video;
  const _VideoTile({required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          video.thumbnail,
          width: double.infinity,
          height: 220,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(video.channelAvatar),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${video.channelName} • ${video.views} • ${video.postedTime}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert, size: 20),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}