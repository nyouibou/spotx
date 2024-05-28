// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:spotx/core/constant/textconstant.dart';
import 'package:spotx/core/db/dbdata.dart';
import 'package:spotx/presentation/home_screen/view/Playlist.dart';
import 'package:spotx/presentation/home_screen/view/abcontainer.dart';
import 'package:spotx/presentation/home_screen/view/artistcontainer.dart';
import 'package:spotx/presentation/home_screen/view/favorites.dart';
import 'package:spotx/presentation/home_screen/view/tracks.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: _isSearching
                ? TextField(
                    controller: _searchController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    autofocus: true,
                  )
                : Text(
                    "MUSIC",
                    style: DefaultStyles.Title1,
                  ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isSearching = !_isSearching;
                  });
                },
                icon: Icon(
                  _isSearching ? Icons.close : Icons.search,
                  color: Colors.white,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )),
            ],
            bottom: TabBar(
              indicatorPadding: EdgeInsets.all(10),
              isScrollable: true,
              labelStyle: DefaultStyles.Title1,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(),
              labelColor: Colors.red,
              indicatorWeight: 10,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: 'Playlist'),
                Tab(text: 'Tracks'),
                Tab(text: 'Albums'),
                Tab(text: 'Artists'),
                Tab(text: 'Favorites'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 15,
                          mainAxisExtent: 254,
                          crossAxisSpacing: 15,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) => PlaylistContainer(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    // child: GridView.builder(
                    //   itemCount: 10,
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //       mainAxisSpacing: 15,
                    //       mainAxisExtent: 254,
                    //       crossAxisSpacing: 15,
                    //       crossAxisCount: 2),
                    //   itemBuilder: (context, index) => TracksContainer(),
                    // ),
                    child: ListView.builder(
                      itemBuilder: (context, index) => TracksContainer(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: Dbdata.albums.length,
                      itemBuilder: (context, index) {
                        return AlbumContainer(
                          img: Dbdata.albums[index]['imageUrl']!,
                          title: Dbdata.albums[index]['title']!,
                          artist: Dbdata.albums[index]['artist']!,
                          tracks: Dbdata.albums[index]['tracks']!,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: Dbdata.albums.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) => ArtistContainer(
                        img: Dbdata.artistInfo[index]['imageUrl']!,
                        artist: Dbdata.artistInfo[index]['artist']!,
                        tracks: Dbdata.artistInfo[index]['tracks']!,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 15,
                          mainAxisExtent: 254,
                          crossAxisSpacing: 15,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) => FavoritesContainer(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
