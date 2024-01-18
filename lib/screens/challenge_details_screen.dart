import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChallengeDetailsScreen extends StatefulWidget {
  final void Function(int) updateUserPointsCallback;

  ChallengeDetailsScreen({required this.updateUserPointsCallback});

  @override
  _ChallengeDetailsScreenState createState() => _ChallengeDetailsScreenState();
}

class _ChallengeDetailsScreenState extends State<ChallengeDetailsScreen> {
  TextEditingController descriptionController = TextEditingController();
  late File imageFile = File(''); // Initialize with an empty File

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Challenge Description
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Challenge Description'),
            ),
            SizedBox(height: 16.0),

            // Image Picker
            ElevatedButton(
              onPressed: () async {
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  setState(() {
                    imageFile = File(pickedFile.path);
                  });
                }
              },
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16.0),

            // Display Selected Image
            imageFile != null && imageFile.existsSync()
                ? Image.file(
              imageFile,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            )
                : Container(),

            SizedBox(height: 16.0),

            // Submit Challenge Button
            ElevatedButton(
              onPressed: () {
                _submitChallenge();
              },
              child: Text('Submit Challenge'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitChallenge() {
    final challengeDescription = descriptionController.text;

    // Check if an image is selected
    if (imageFile != null && imageFile.existsSync()) {
      final imagePath = imageFile.path;

      // Save challenge details and image path
      _saveChallengeDetails(challengeDescription, imagePath);

      // Reward the current user with 50 points and return the points to the previous screen
      _rewardCurrentUser(50);

      // Show a confirmation message
      _showConfirmation();

      // Navigate back to the previous screen and pass the result (points)
      widget.updateUserPointsCallback(50);
      Navigator.pop(context, 50);
    } else {
      // Show an error message or handle the case where no image is selected
      print('Error: No image selected');
    }
  }

  void _saveChallengeDetails(String description, String imagePath) {
    print('Challenge Details Saved:');
    print('Description: $description');
    print('Image Path: $imagePath');
  }

  void _rewardCurrentUser(int points) {
    print('User Rewarded with $points points!');
  }

  void _showConfirmation() {
    // Use a SnackBar to show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Challenge saved!'),
      ),
    );
  }
}
