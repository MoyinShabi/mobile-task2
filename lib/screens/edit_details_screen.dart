import 'package:flutter/material.dart';

class EditDetailsScreen extends StatefulWidget {
  final String fullName;
  final String headline;
  final String slackUsername;
  final String githubHandle;
  final String about;
  final String imageUrl;
  final Function(Map<String, String>) onSave;

  const EditDetailsScreen({
    super.key,
    required this.fullName,
    required this.headline,
    required this.slackUsername,
    required this.githubHandle,
    required this.about,
    required this.onSave,
    required this.imageUrl,
  });

  @override
  State<EditDetailsScreen> createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _headlineController = TextEditingController();
  final TextEditingController _slackUsernameController =
      TextEditingController();
  final TextEditingController _githubHandleController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  void initState() {
    _fullNameController.text = widget.fullName;
    _headlineController.text = widget.headline;
    _slackUsernameController.text = widget.slackUsername;
    _githubHandleController.text = widget.githubHandle;
    _aboutController.text = widget.about;
    _imageUrlController.text = widget.imageUrl;
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _headlineController.dispose();
    _slackUsernameController.dispose();
    _githubHandleController.dispose();
    _aboutController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Map<String, String> editedData = {
        'fullName': _fullNameController.text,
        'headline': _headlineController.text,
        'slackUsername': _slackUsernameController.text,
        'githubHandle': _githubHandleController.text,
        'about': _aboutController.text,
        'imageUrl': _imageUrlController.text,
      };
      widget.onSave(editedData);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit CV'),
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  maxLength: 50,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      return 'Must be between 2 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _fullNameController.text = value!;
                  },
                ),
                TextFormField(
                  controller: _headlineController,
                  decoration: const InputDecoration(labelText: 'Headline'),
                  maxLength: 50,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      return 'Must be between 2 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _headlineController.text = value!;
                  },
                ),
                TextFormField(
                  controller: _slackUsernameController,
                  decoration:
                      const InputDecoration(labelText: 'Slack Username'),
                  maxLength: 50,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      return 'Must be between 2 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _slackUsernameController.text = value!;
                  },
                ),
                TextFormField(
                  controller: _githubHandleController,
                  decoration: const InputDecoration(
                    labelText: 'GitHub Handle',
                  ),
                  maxLength: 50,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      return 'Must be between 2 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _githubHandleController.text = value!;
                  },
                ),
                TextFormField(
                  controller: _aboutController,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    labelText: 'About',
                    hintText: 'Briefly describe yourself',
                    hintStyle: TextStyle(fontSize: 14),
                    alignLabelWithHint: true,
                  ),
                  maxLength: 350,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1) {
                      return 'Must be between 2 and 350 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _aboutController.text = value!;
                  },
                ),
                TextFormField(
                  controller: _imageUrlController,
                  decoration: const InputDecoration(
                      labelText: 'Display Photo URL',
                      hintText: 'E.g https://picsum.photos/536/354',
                      hintStyle: TextStyle(fontSize: 14),
                      helperText: 'Copy and paste a valid URL'),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        !Uri.parse(value).hasAbsolutePath) {
                      return 'Enter a valid URL';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _imageUrlController.text = value!;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _saveChanges,
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
