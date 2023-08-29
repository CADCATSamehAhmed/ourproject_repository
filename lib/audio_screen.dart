import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit.dart';
import 'states.dart';

class AudioScreen extends StatelessWidget {

  late AudioPlayer player;
  Duration position = const Duration(seconds: 0);
  Duration length = const Duration(seconds: 0);

  AudioScreen(this.player);

  //Slider
  Widget slider() {
    return Container(
      width: 250.0,
      child: Slider(
        activeColor: Colors.blue[800],
        inactiveColor: Colors.grey[350],
        max: length.inSeconds.toDouble(),
        value: position.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
        },
      ),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    player.seek(newPos);
  }

  // @override
  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder:(BuildContext context)=>BlocConsumer<MusicCubit,MusicStates>(
        listener: (context, state) {},
        builder: (context, state) =>Scaffold(
          appBar: AppBar(
          title: const Text("Music"),
          centerTitle: true,
          ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[800]!,
              Colors.grey[200]!,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 48.0,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    '',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'nooooooo',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Center(
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/image1.jpg')),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              slider(),
                              Text(
                                "${length.inMinutes}:${length.inSeconds.remainder(60)}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.skip_previous),
                              iconSize: 45.0,
                              color: Colors.blue,
                            ),
                            IconButton(
                              onPressed: () {
                                if (player.state == PlayerState.playing)
                                {

                                }
                              },
                              icon: player.state == PlayerState.playing?Icon(Icons.pause):Icon(Icons.play_arrow),
                              iconSize: 62.0,
                              color: Colors.blue[800],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.skip_next),
                              iconSize: 45.0,
                              color: Colors.blue,
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        ),
      ),
    );
  }
}








// StreamBuilder(
//     stream: widget.player.onPositionChanged,
//     builder: (context, snapshot) {
//       return ProgressBar(
//         progress: snapshot.data ?? const Duration(seconds: 0),
//         total: maxDuration,
//         onSeek: (duration) {
//           widget.player.seek(duration);
//           setState(() {});
//         },
//       );
//     }),
// const SizedBox(height: 20),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     IconButton(
//         onPressed: () {
//           widget.player.stop();
//           widget.player.play(AssetSource(
//               musics[--widget.index % musics.length].path));
//           getMaxDuration();
//         },
//         icon: const Icon(
//           Icons.skip_previous,
//           size: 36,
//           color: Colors.white,
//         )),
//     IconButton(
//         onPressed: () {
//           widget.player.state == PlayerState.playing
//               ? widget.player.pause()
//               : widget.player.play(AssetSource(
//               musics[widget.index % musics.length].path));
//           getMaxDuration();
//           setState(() {});
//         },
//         icon: Icon(
//           widget.player.state == PlayerState.playing
//               ? Icons.pause
//               : Icons.play_arrow,
//           size: 40,
//           color: Colors.white,
//         )),
//     IconButton(
//         onPressed: () {
//           widget.player.stop();
//           widget.player.play(AssetSource(
//               musics[--widget.index % musics.length].path));
//           getMaxDuration();
//
//           setState(() {});
//         },
//         icon: const Icon(
//           Icons.skip_next,
//           size: 36,
//           color: Colors.white,
//         )),
// ]
// ),