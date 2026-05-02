import 'package:flutter/material.dart';
import 'package:youtube_app/models/video_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<VideoModel> videos = [
      VideoModel(
        thumbnail: 'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zmx1dHRlcnxlbnwwfHwwfHx8MA%3D%3D',
        title: 'How to create flutter apps in 2026',
        channelName: 'Flutter Master',
        views: '150K views',
        postedTime: '2 hours ago',
        channelAvatar: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.icon-icons.com%2Ficons2%2F2108%2FPNG%2F512%2Fflutter_icon_130936.png&f=1&nofb=1&ipt=9f28163dc13a08a16c210a5b50a8360878d625657cfe1b202c04c9fe3beba213',
      ),
      VideoModel(
        thumbnail: 'https://plus.unsplash.com/premium_photo-1676496046182-356a6a0ed002?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bGFuZHNjYXBlfGVufDB8fDB8fHww',
        title: 'Look mom, we got some videos',
        channelName: 'Fireship',
        views: '45K views',
        postedTime: '1 day ago',
        channelAvatar: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn-1.webcatalog.io%2Fcatalog%2Ffireship%2Ffireship-icon-filled-256.png%3Fv%3D1675592676848&f=1&nofb=1&ipt=41c42602d0dd8946344b13eabcca34ff0f4e3cb954c3d6b554ae405e440ab952',
      ),
      VideoModel(
        thumbnail: 'https://images.unsplash.com/photo-1489875347897-49f64b51c1f8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8amF2YXxlbnwwfHwwfHx8MA%3D%3D',
        title: 'Look mom, the feed is mocked!',
        channelName: 'Dev News',
        views: '1.2M views',
        postedTime: '1 week ago',
        channelAvatar: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fih1.redbubble.net%2Fimage.416406976.0438%2Fposter%2C504x498%2Cf8f8f8-pad%2C600x600%2Cf8f8f8.u4.jpg&f=1&nofb=1&ipt=b00c317d48404d5fb89b7bbfa7ac15e886303e774853861fb383819825881837',
      ),
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Column(
            children: [
              Image.network(
                video.thumbnail,
                width: double.infinity,
                height: 200,
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
        },
      ),
    );
  }
}