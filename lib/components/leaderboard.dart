import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Leaderboard',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          LeaderboardItem(),
          LeaderboardItem(),
          LeaderboardItem(),
        ],
      ),
    );
  }
}

class LeaderboardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        // Add user profile image
      ),
      title: Text('Username'),
      subtitle: Text('Points: 100'),
    );
  }
}
