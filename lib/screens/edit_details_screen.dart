import 'package:flutter/material.dart';

class EditDetailsScreen extends StatefulWidget {
  final Function(Map<String, String>) onSave;
  final String fullName;
  final String slackUsername;
  final String githubHandle;
  final String bio;

  const EditDetailsScreen({
    super.key,
    required this.onSave,
    required this.fullName,
    required this.slackUsername,
    required this.githubHandle,
    required this.bio,
  });

  @override
  State<EditDetailsScreen> createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _slackUsernameController =
      TextEditingController();

  final TextEditingController _githubHandleController = TextEditingController();

  final TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    _fullNameController.text = widget.fullName;
    _slackUsernameController.text = widget.slackUsername;
    _githubHandleController.text = widget.githubHandle;
    _bioController.text = widget.bio;
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _slackUsernameController.dispose();
    _githubHandleController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
              TextFormField(
                controller: _slackUsernameController,
                decoration: const InputDecoration(labelText: 'Slack Username'),
              ),
              TextFormField(
                controller: _githubHandleController,
                decoration: const InputDecoration(labelText: 'GitHub Handle'),
              ),
              TextFormField(
                controller: _bioController,
                maxLines: 10,
                decoration: const InputDecoration(labelText: 'Brief Bio'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Map<String, String> editedData = {
                    'fullName': _fullNameController.text,
                    'slackUsername': _slackUsernameController.text,
                    'githubHandle': _githubHandleController.text,
                    'bio': _bioController.text,
                  };
                  widget.onSave(editedData);
                  Navigator.of(context).pop();
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
