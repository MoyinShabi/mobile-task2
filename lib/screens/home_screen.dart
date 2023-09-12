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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DisplayPhoto(),
              const SizedBox(height: 24),
              Section(sectionName: 'Full Name', text: fullName),
              const Divider(thickness: 4),
              const SizedBox(height: 10),
              Section(sectionName: 'Slack Username', text: slackUsername),
              const Divider(thickness: 4),
              const SizedBox(height: 10),
              Section(sectionName: 'GitHub Handle', text: githubHandle),
              const Divider(thickness: 4),
              const SizedBox(height: 10),
              Section(sectionName: 'About Me', text: bio, textFontSize: 14),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        elevation: 0,
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
        icon: const Icon(Icons.edit_rounded),
        label: const Text('Edit CV'),
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
