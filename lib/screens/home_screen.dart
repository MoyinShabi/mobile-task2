import 'package:flutter/material.dart';
import 'package:mobile_task2/widgets/display_photo.dart';
import 'edit_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = 'Moyinoluwa Shabi';
  String headline = 'Mobile Developer | Computer Engineering Student';
  String slackUsername = 'Moyin Shabi';
  String githubHandle = '@MoyinShabi';
  String about =
      "Currently a college student with a huge interest in technology. I wish to further develop my skills, gain others, and build projects based on my growing interests. Hence, I’ll be able to contribute to the society and organizations I’ll be privileged to work for.";
  String imageUrl =
      'https://ca.slack-edge.com/T05FFAA91JP-U05R9C5KVM1-4330588d04f6-512';
  void _updateData(Map<String, String> editedData) {
    setState(() {
      fullName = editedData['fullName'] ?? fullName;
      headline = editedData['headline'] ?? headline;
      slackUsername = editedData['slackUsername'] ?? slackUsername;
      githubHandle = editedData['githubHandle'] ?? githubHandle;
      about = editedData['about'] ?? about;
      imageUrl = editedData['imageUrl'] ?? imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My CV'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DisplayPhoto(imageUrl: imageUrl),
              const SizedBox(height: 20),
              Text(
                fullName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                headline,
                style: const TextStyle(fontSize: 16),
              ),
              const Divider(thickness: 4),
              const SizedBox(height: 10),
              Section(sectionName: 'About', text: about, textFontSize: 14),
              const Divider(thickness: 4),
              const SizedBox(height: 10),
              Section(sectionName: 'Slack', text: slackUsername),
              const Divider(thickness: 4),
              const SizedBox(height: 10),
              Section(sectionName: 'GitHub', text: githubHandle),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        elevation: 0,
        icon: const Icon(Icons.edit_rounded),
        label: const Text('Edit CV'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditDetailsScreen(
                fullName: fullName,
                headline: headline,
                slackUsername: slackUsername,
                githubHandle: githubHandle,
                about: about,
                imageUrl: imageUrl,
                onSave: _updateData,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.sectionName,
    required this.text,
    this.textFontSize = 16,
  });
  final String sectionName;
  final String text;
  final double textFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: textFontSize,
          ),
        ),
      ],
    );
  }
}
