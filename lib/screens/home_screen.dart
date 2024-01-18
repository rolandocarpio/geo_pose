import 'package:flutter/material.dart';
import 'package:geo_pose/screens/user_profile_screen.dart';
import '../components/challenge_feed.dart';
import '../components/leaderboard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeoSnap Battles'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Challenge Feed
          Expanded(
            child: ChallengeFeed(),
          ),
          // Leaderboard
          Leaderboard(),
        ],
      ),
    );
  }
}
