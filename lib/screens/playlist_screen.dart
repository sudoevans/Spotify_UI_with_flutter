import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 146.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                    child: const Icon(Icons.chevron_left, size: 28.0),
                  )),
              SizedBox(
                width: 16.0,
              ),
              InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                    child: const Icon(Icons.chevron_right, size: 28.0),
                  ))
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Row(
            children: [
              TextButton.icon(
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).iconTheme.color),
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle_outlined),
                  label: Text('Gamer Snave')),
              SizedBox(
                width: 8.0,
              ),
              IconButton(
                  padding: const EdgeInsets.only(),
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30.0,
                  )),
              SizedBox(
                width: 20.0,
              )
            ],
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              const Color(0XFFAF1018),
              Theme.of(context).backgroundColor
            ],
                stops: [
              0,
              0.3
            ])),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 60.0,
            ),
            children: [
              PlaylistHeader(playlist: widget.playlist),
              // TracksList(tracks: widget.playlist.songs)
            ],
          ),
        ),
      ),
    );
  }
}
