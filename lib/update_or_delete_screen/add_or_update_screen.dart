import 'package:flutter/material.dart';

// Action type
enum ActionType { addNote, editNote }

// Screen to add and update note
class ScreenNoteEdit extends StatelessWidget {
  // Route Name
  static String editRouteName = 'Note Edit Page';
  static String addRouteName = 'Note Add Page';

  // Action
  final ActionType screenMode;
  String? id;
  ScreenNoteEdit(
      {super.key,
      required this.screenMode,
      this.id,
      this.currentTitle,
      this.currentContent});

  //edit contents
  String? currentTitle;
  String? currentContent;

  //keys
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //controllers
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (screenMode == ActionType.editNote) {
      titleController.text = currentTitle!;
      contentController.text = currentContent!;
    }
    return Scaffold(
      appBar: AppBar(
        title: (screenMode == ActionType.addNote)
            ? const Text('Add Note')
            : const Text('Edit Note'),
        centerTitle: true,
        actions: [
          TextButton.icon(
              onPressed: () {
                switch (screenMode) {
                  case ActionType.addNote:
                    //add note
                    break;

                  case ActionType.editNote:
                    //edit and save
                    break;
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('Save'))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Title text field
              Form(
                key: formKey1,
                child: TextFormField(
                  controller: titleController,
                  validator: (title) => (title == null || title.isEmpty)
                      ? 'Title is Empty'
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              // Flexible widget with flex factor 1 to make the Note field take all remaining space
              Form(
                key: formKey2,
                child: Flexible(
                  child: TextFormField(
                    controller: contentController,
                    validator: (content) => (content == null || content.isEmpty)
                        ? 'Title is Empty'
                        : null,
                    maxLines: 200,
                    decoration: InputDecoration(
                      hintText: 'Note',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Save Function
}
