import 'package:flutter/material.dart';
import 'package:heynoteapp/db/firebase/functions..dart';
import 'package:heynoteapp/update_or_delete_screen/add_or_update_screen.dart';

class Note extends StatelessWidget {
  //note contents
  String id;
  String title;
  String content;

  //constructor
  Note(
      {required this.id,
      required this.title,
      required this.content,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //tap property
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ScreenNoteEdit(
            screenMode: ActionType.editNote,
            id: id,
            currentTitle: title,
            currentContent: content,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            //first row item
            Row(
              children: [
                Expanded(
                    child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                )),
                IconButton(
                    onPressed: () {
                      FireStoreDb.instance.deleteNote(id);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
            //second row item
            Expanded(
                child: Text(
              content,
              overflow: TextOverflow.ellipsis,
              maxLines: 7,
              style: const TextStyle(fontSize: 15.0),
            ))
          ],
        ),
      ),
    );
  }
}
