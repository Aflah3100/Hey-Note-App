import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:heynoteapp/all_notes-screen/screen_all_notes.dart';
import 'package:heynoteapp/update_or_delete_screen/add_or_update_screen.dart';
import 'package:heynoteapp/utils/theme_manager.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note-App',
      themeMode: ThemeMode.light,
      theme: ThemeManager().lightTheme,
      darkTheme: ThemeManager().darkTheme,
      home: const ScreenDisplayNotes(),
      routes: {
        ScreenNoteEdit.addRouteName: (context) =>
            ScreenNoteEdit(screenMode: ActionType.addNote),
      },
    );
  }
}
