import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heynoteapp/db/model/note_model.dart';

abstract class FirestoreFunctions {
  Future<void> addNote(NoteModel note, BuildContext context);
  Future<void> updateNote(NoteModel note, BuildContext context);
  Future<void> deleteNote(String noteId);
}

class FireStoreDb implements FirestoreFunctions {
  //Singleton
  FireStoreDb._internal();

  //static instance
  static FireStoreDb instance = FireStoreDb._internal();

  factory FireStoreDb() {
    return instance;
  }

  //collection name
  static const collectionName = 'notes';
  @override
  Future<void> addNote(NoteModel note, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(note.id)
          .set(note.toJson())
          .whenComplete(() => Navigator.of(context).pop());
    } on FirebaseException {
      // ignore: use_build_context_synchronously
      return showDialog(
          context: context,
          builder: (alertContext) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Error in Saving Note'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(alertContext).pop();
                    },
                    child: const Text('Close'))
              ],
            );
          });

      // ignore: use_build_context_synchronously
    }
  }

  @override
  Future<void> deleteNote(String noteId) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(noteId)
        .delete();
  }

  @override
  Future<void> updateNote(NoteModel note, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(note.id)
          .update(note.toJson())
          .whenComplete(() => Navigator.of(context).pop());
    } on FirebaseException {
      // ignore: use_build_context_synchronously
      return showDialog(
          context: context,
          builder: (alertContext) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Error in Saving Note'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(alertContext).pop();
                    },
                    child: const Text('Close'))
              ],
            );
          });
    }
    throw UnimplementedError();
  }
}
