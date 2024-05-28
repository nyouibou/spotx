import 'package:flutter/material.dart';
import 'dart:io';

import 'package:spotx/core/service/audioservice.dart';

class TracksContainer extends StatelessWidget {
  const TracksContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Files'),
      ),
      body: FutureBuilder<List<FileSystemEntity>>(
        future: AudioService().getAudioFiles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No audio files found'));
          } else {
            final audioFiles = snapshot.data!;
            return ListView.builder(
              itemCount: audioFiles.length,
              itemBuilder: (context, index) {
                final file = audioFiles[index];
                return AudioTile(file: file);
              },
            );
          }
        },
      ),
    );
  }
}

class AudioTile extends StatelessWidget {
  final FileSystemEntity file;

  const AudioTile({required this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.symmetric(),
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Bangarang.jpg"), fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                file.path.split('/').last, // Display file name
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Unknown Artist', // Placeholder for artist name
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
