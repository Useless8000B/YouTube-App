import 'package:flutter/material.dart';
import 'package:youtube_app/colors.dart';
import 'package:youtube_app/models/video_model.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<VideoModel> history = [
      VideoModel(
        thumbnail: 'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?w=500',
        title: 'How to create flutter apps in 2026',
        channelName: 'Flutter Master',
        views: '150K views',
        postedTime: '2 hours ago',
        channelAvatar: '...',
      ),
      VideoModel(
        thumbnail: 'https://plus.unsplash.com/premium_photo-1676496046182-356a6a0ed002?w=500',
        title: 'Look mom, we got some videos',
        channelName: 'Fireship',
        views: '45K views',
        postedTime: '1 day ago',
        channelAvatar: '...',
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.purple,
                    child: Text('U', style: TextStyle(fontSize: 32, color: AppColors.white)),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User Name', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('@useririneu • View channel >', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),

            _buildQuickActions(),

            _buildSectionHeader('History', 'View all'),
            _buildHorizontalVideoList(history),

            const Divider(height: 32),

            _buildSectionHeader('Playlists', 'View all'),
            _buildHorizontalPlaylists(),

            _buildMenuOption(Icons.smart_display_outlined, 'Your videos'),
            _buildMenuOption(Icons.download_outlined, 'Downloads'),
            _buildMenuOption(Icons.movie_outlined, 'Your movies'),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _actionChip(Icons.switch_account_outlined, 'Switch account'),
            _actionChip(Icons.account_circle_outlined, 'Google Account'),
            _actionChip(Icons.visibility_off_outlined, 'Turn on Incognito'),
          ],
        ),
      ),
    );
  }

  Widget _actionChip(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ActionChip(
        avatar: Icon(icon, size: 18),
        label: Text(label),
        backgroundColor: Colors.grey[200],
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              shape: StadiumBorder(),
            ),
            child: Text(action, style: const TextStyle(color: AppColors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalVideoList(List<VideoModel> videos) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Container(
            width: 160,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(video.thumbnail, height: 90, width: 160, fit: BoxFit.cover),
                ),
                const SizedBox(height: 4),
                Text(video.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                Text(video.channelName, style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHorizontalPlaylists() {
    return _buildHorizontalVideoList([]);
  }

  Widget _buildMenuOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: () {},
    );
  }
}