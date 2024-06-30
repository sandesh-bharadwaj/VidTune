// Main packages required for Home Screen
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:vibematch/functions/file_handling.dart';
import 'package:vibematch/screens/video_editor.dart';
import 'package:file_picker/file_picker.dart';


// Home Screen implementation

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  PlatformFile? selectedFile;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  selectFile().then((value) {
                    setState(() {
                      selectedFile = value;
                    });
                  });
                },
                child: const Text("Select file")
              ),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return VideoEditorPage(selectedFilePath: selectedFile?.path);
                    }));
                    if (kDebugMode) {
                      developer.log("go to videoEdit");
                    }
                  },
                  child: const Text("move ahead heathen")),
            ),
          ],
        ),
      ),
    );
  }
}