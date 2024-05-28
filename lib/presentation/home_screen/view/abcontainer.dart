import 'package:flutter/material.dart';
import 'package:spotx/core/constant/textconstant.dart';

class AlbumContainer extends StatelessWidget {
  final String img;
  final String title;
  final String artist;
  final String tracks;

  const AlbumContainer({
    Key? key,
    required this.img,
    required this.title,
    required this.artist,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: DefaultStyles.AlbumName,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  artist,
                  style: DefaultStyles.Artistconst,
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(tracks, style: DefaultStyles.Timeconst),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
