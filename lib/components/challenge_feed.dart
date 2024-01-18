// challenge_feed.dart

import '../screens/challenge_details_screen.dart';
import 'package:flutter/material.dart';

class ChallengeFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChallengeItem(),
        ChallengeItem(),
        ChallengeItem(),
        // Add more ChallengeItem widgets as needed
      ],
    );
  }
}

class ChallengeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Challenge Title'),
        subtitle: Text('Location: City, Theme: Adventure'),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChallengeDetailsScreen(updateUserPointsCallback: (int ) {  },)),
            );
          },
          child: Text('Participate'),
        ),
      ),
    );
  }
}