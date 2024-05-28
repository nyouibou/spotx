import 'package:spotx/core/constant/imageconst.dart';

class Dbdata {
  static List<Map<String, String>> albums = [
    {
      'title': 'After Hours (D...)',
      'artist': 'The Weeknd',
      'tracks': '8 TRACKS',
      'imageUrl': ImagesDB.m2, // Replace with your asset image
    },
    {
      'title': 'Dawn FM',
      'artist': 'The Weeknd',
      'tracks': '5 TRACKS',
      'imageUrl': ImagesDB.m1, // Replace with your asset image
    },
    {
      'title': 'Starboy',
      'artist': 'The Weeknd',
      'tracks': '2 TRACKS',
      'imageUrl': ImagesDB.m3, // Replace with your asset image
    },
    {
      'title': 'My Dear Melanc...',
      'artist': 'The Weeknd',
      'tracks': '1 TRACK',
      'imageUrl': ImagesDB.m5, // Replace with your asset image
    },
    {
      'title': 'Trilogy',
      'artist': 'The Weeknd',
      'tracks': '3 TRACKS',
      'imageUrl': ImagesDB.m7, // Replace with your asset image
    },
    {
      'title': 'Harry\'s House',
      'artist': 'Harry Styles',
      'tracks': '1 TRACK',
      'imageUrl': ImagesDB.m4, // Replace with your asset image
    },
  ];
 static List<Map<String, String>> artistInfo = [
    {
      'artist': 'The Weeknd',
      'imageUrl': ImagesDB.m2, // Replace with your asset image
      'tracks': '8 TRACKS',
    },
    {
      'artist': 'The Weeknd',
      'imageUrl': ImagesDB.m1, // Replace with your asset image
      'tracks': '5 TRACKS',
    },
    {
      'artist': 'The Weeknd',
      'imageUrl': ImagesDB.m3, // Replace with your asset image
      'tracks': '2 TRACKS',
    },
    {
      'artist': 'The Weeknd',
      'imageUrl': ImagesDB.m5, // Replace with your asset image
      'tracks': '1 TRACK',
    },
    {
      'artist': 'The Weeknd',
      'imageUrl': ImagesDB.m7, // Replace with your asset image
      'tracks': '3 TRACKS',
    },
    {
      'artist': 'Harry Styles',
      'imageUrl': ImagesDB.m4, // Replace with your asset image
      'tracks': '1 TRACK',
    },
  ];

  static List<Map<String, String>> playlists = [
    // Example data
    {
      'title': 'Playlist 1',
      'imageUrl': 'url1',
      'artist': 'Artist 1',
      'tracks': '10'
    },
    // More data...
  ];
  static List<Map<String, String>> tracks = [
    // Example data
    {
      'title': 'Track 1',
      'imageUrl': 'url1',
      'artist': 'Artist 1',
      'album': 'Album 1'
    },
    // More data...
  ];

// Extracting only the titles from the list of maps
  static List<String?> trackTitles =
      tracks.map((track) => track['title']).toList();

  static List<Map<String, String>> artists = [
    // Example data
    {'name': 'Artist 1', 'imageUrl': 'url1'},
    // More data...
  ];

  static List<Map<String, String>> favorites = [
    // Example data
    {
      'title': 'Favorite 1',
      'imageUrl': 'url1',
      'artist': 'Artist 1',
      'album': 'Album 1'
    },
    // More data...
  ];
}
