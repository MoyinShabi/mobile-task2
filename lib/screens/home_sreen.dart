import 'package:flutter/material.dart';
import 'edit_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = 'Moyinoluwa Shabi';
  String slackUsername = 'Moyin Shabi';
  String githubHandle = '@MoyinShabi';
  String bio =
      "Currently a college student with a huge interest in technology. I wish to further develop my skills, gain others, and build projects based on my growing interests. Hence, I’ll be able to contribute to the society and organizations I’ll be privileged to work for.";

  void updateData(Map<String, String> editedData) {
    setState(() {
      fullName = editedData['fullName'] ?? fullName;
      slackUsername = editedData['slackUsername'] ?? slackUsername;
      githubHandle = editedData['githubHandle'] ?? githubHandle;
      bio = editedData['bio'] ?? bio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My CV'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Full Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(fullName, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            const Text(
              'Slack Username:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(slackUsername, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            const Text(
              'GitHub Handle:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(githubHandle, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            const Text(
              'Brief Bio:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(bio, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditDetailsScreen(
                      onSave: updateData,
                      fullName: fullName,
                      slackUsername: slackUsername,
                      githubHandle: githubHandle,
                      bio: bio,
                    ),
                  ),
                );
              },
              child: const Text('Edit CV'),
            ),
          ],
        ),
      ),
    );
  }
}
