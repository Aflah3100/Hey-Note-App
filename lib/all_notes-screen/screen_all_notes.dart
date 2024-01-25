import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heynoteapp/all_notes-screen/widgets/note.dart';
import 'package:heynoteapp/db/firebase/functions..dart';
import 'package:heynoteapp/update_or_delete_screen/add_or_update_screen.dart';

class ScreenDisplayNotes extends StatelessWidget {
  const ScreenDisplayNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(FireStoreDb.collectionName)
                  .snapshots(),
              builder: (context, noteSnapshots) {
                if (noteSnapshots.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (noteSnapshots.hasData) {
                  final noteLists=noteSnapshots.data!.docs ;
                  if(noteLists.isEmpty){
                     return const Center(child: Text('Hey Notes!'),);
                  }
                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    padding: const EdgeInsets.all(20.0),
                    children: List.generate(
                      noteLists.length,
                      (index) {
                        final currentNote=noteLists[index];
                        return Note(id: currentNote.id, title: currentNote['title'], content: currentNote['content']);
                      }
                    ),
                  );
                }else{
                  return const Center(child: Text('Hey Notes!'),);
                }
                
              })),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(ScreenNoteEdit.addRouteName);
        },
        label: const Text('Add Note'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
