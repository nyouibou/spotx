import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SongListPage extends StatefulWidget {
  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  List<FileSystemEntity> _files = [];
  Directory? _directory;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      _getDirectory();
    } else {
      // Show a dialog or message to the user indicating that permission is required
      _showPermissionDeniedDialog();
    }
  }

  Future<void> _getDirectory() async {
    final directory = await getExternalStorageDirectory();
    setState(() {
      _directory = directory;
      _listFiles();
    });
  }

  void _listFiles() {
    if (_directory != null) {
      setState(() {
        _files = _directory!.listSync().where((file) {
          return file.path.endsWith('.mp3');
        }).toList();
      });
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Permission Denied'),
          content: Text(
              'Storage permission is required to access and display song files.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song List'),
      ),
      body: _files.isNotEmpty
          ? ListView.builder(
              itemCount: _files.length,
              itemBuilder: (context, index) {
                final file = _files[index];
                return ListTile(
                  title: Text(file.path.split('/').last),
                );
              },
            )
          : Center(
              child: Text('No songs found'),
            ),
    );
  }
}
