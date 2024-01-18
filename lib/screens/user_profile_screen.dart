import 'package:flutter/material.dart';
import 'challenge_details_screen.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int userPoints = 0;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display User Name Input
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            SizedBox(height: 16.0),

            // Display User Points
            Text(
              'Points: $userPoints',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),

            // Display Challenges
            Text(
              'Challenges:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),

            // Button to navigate to ChallengeDetailsScreen
            ElevatedButton(
              onPressed: () async {
                // Navigate to ChallengeDetailsScreen and wait for a result
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChallengeDetailsScreen(
                      updateUserPointsCallback: _updateUserPoints,
                    ),
                  ),
                );

                // Check if the result is not null and update user points
                if (result != null) {
                  _updateUserPoints(result);
                }
              },
              child: Text('Take a Challenge'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to update user points
  void _updateUserPoints(int pointsToAdd) {
    setState(() {
      userPoints += pointsToAdd;
    });
  }
}
