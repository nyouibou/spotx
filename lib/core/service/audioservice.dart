import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioService {
  Future<List<FileSystemEntity>> getAudioFiles() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final directory = await getExternalStorageDirectory();
      if (directory != null) {
        final audioFiles = directory
            .listSync()
            .where((file) =>
                file.path.endsWith('.mp3') ||
                file.path.endsWith('.wav') ||
                file.path.endsWith('.m4a'))
            .toList();
        return audioFiles;
      }
    }
    return [];
  }
}
