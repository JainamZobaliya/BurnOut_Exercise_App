import 'package:audio_manager/audio_manager.dart';
import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';

class Songspage extends StatefulWidget {
  String song_name, artist_name, song_url, image_url;
  Songspage({this.song_name, this.artist_name, this.song_url, this.image_url});
  @override
  _SongspageState createState() => _SongspageState();
}

class _SongspageState extends State<Songspage> {
  MusicPlayer musicPlayer;
  bool isPlaying = false;

  double _slider;
  @override
  void initState() {
    super.initState();
    initPlatformState();
    setupAudio();
  }

  void setupAudio() {
    audioManagerInstance.onEvents((events, args) {
      switch (events) {
        case AudioManagerEvents.start:
          _slider = 0;
          break;
        case AudioManagerEvents.seekComplete:
          _slider = audioManagerInstance.position.inMilliseconds /
              audioManagerInstance.duration.inMilliseconds;
          setState(() {
          });
          break;
        case AudioManagerEvents.playstatus:
          isPlaying = audioManagerInstance.isPlaying;
          setState(() {
          });
          break;
        case AudioManagerEvents.timeupdate:
          _slider = audioManagerInstance.position.inMilliseconds /
              audioManagerInstance.duration.inMilliseconds;
          audioManagerInstance.updateLrc(args["position"].toString());
          setState(() {
          });
          break;
        case AudioManagerEvents.ended:
          audioManagerInstance.next();
          setState(() {
          });
          break;
        default:
          break;
      }
    });
  }
  // Initializing the Music Player and adding a single [PlaylistItem]
  Future<void> initPlatformState() async {
    musicPlayer = MusicPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Songs"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF03424F),
        // decoration: BoxDecoration(
        // image: DecorationImage(
        // image: AssetImage("images/bg2.jpg"), fit: BoxFit.cover,)),
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>
              [
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  widget.song_name,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.artist_name,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),child: Image.network(widget.image_url, fit: BoxFit.cover, height: 300,)),
                  elevation: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   color: isPlaying ?Colors.red:Colors.green,
                      //   height: 2,
                      // ),
                      // Container(
                      //   color: Colors.transparent,
                      //   padding: EdgeInsets.all(10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: <Widget>[
                      //       IconButton(
                      //         icon: Icon(isPlaying ? Icons.pause:Icons.play_arrow),
                      //         iconSize: 60.0,
                      //         color: isPlaying? Colors.yellow:Colors.green,
                      //         onPressed: (){
                      //           if(isPlaying){
                      //             musicPlayer.pause();
                      //             setState(() {
                      //               isPlaying=false;
                      //             });
                      //           }
                      //           else{
                      //                 setState(() {
                      //                   isPlaying=true;
                      //                 });
                      //                 musicPlayer.play(MusicItem(
                      //                 trackName: widget.song_name==null?'':widget.song_name,
                      //                 albumName: '',
                      //                 artistName: widget.artist_name==null?'':widget.artist_name,
                      //                 url: widget.song_url==null?'':widget.song_url,
                      //                 coverUrl: widget.image_url==null?'':widget.image_url,
                      //                 duration: Duration(seconds: 255),
                      //               ));
                      //           }
                      //         }),
                      //       if(isPlaying)
                      //         IconButton(
                      //             icon: Icon(isPlaying ? Icons.stop : null),
                      //             // icon: isPlaying?Icon(
                      //             //   Icons.stop,
                      //             // ):Icon(null),
                      //             // color: isPlaying?Colors.red:Colors.transparent,
                      //             color: Colors.red,
                      //             iconSize: 60.0,
                      //             onPressed: () {
                      //               setState(() {
                      //                 musicPlayer.stop();
                      //                 isPlaying = false;
                      //               });
                      //             }
                      //         ),
                      //     ],
                      //   ),
                      // ),
                      bottomPanel(),
                    ],
                  ),
                )
              ],
        )),
    )
    );
  }

  String _formatDuration(Duration d) {
    if (d == null) return "--:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }

  Widget songProgress(BuildContext context) {
    var style = TextStyle(color: Colors.black);
    return Row(
      children: <Widget>[
        Text(
          _formatDuration(audioManagerInstance.position),
          style: style,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  thumbColor: Colors.blueAccent,
                  overlayColor: Colors.blue,
                  thumbShape: RoundSliderThumbShape(
                    disabledThumbRadius: 5,
                    enabledThumbRadius: 5,
                  ),
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 10,
                  ),
                  activeTrackColor: Colors.blueAccent,
                  inactiveTrackColor: Colors.grey,
                ),
                child: Slider(
                  value: _slider ?? 0,
                  onChanged: (value) {
                    setState(() {
                      _slider = value;
                    });
                  },
                  onChangeEnd: (value) {
                    if (audioManagerInstance.duration != null) {
                      Duration msec = Duration(
                          milliseconds:
                          (audioManagerInstance.duration.inMilliseconds *
                              value)
                              .round());
                      audioManagerInstance.seekTo(msec);
                    }
                  },
                )),
          ),
        ),
        Text(
          _formatDuration(audioManagerInstance.duration),
          style: style,
        ),
      ],
    );
  }

  Widget bottomPanel() {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: songProgress(context),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              child: Center(
                child: IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                    ),
                    onPressed: () => audioManagerInstance.previous()),
              ),
              backgroundColor: Colors.cyan.withOpacity(0.3),
            ),
            CircleAvatar(
              radius: 30,
              child: Center(
                child: IconButton(
                  onPressed: () async {
                    if(!audioManagerInstance.isPlaying && _slider==0) {
                      audioManagerInstance
                          .start("${widget.song_url}", widget.song_name,
                          desc: widget.artist_name,
                          auto: true,
                          cover: widget.image_url)
                          .then((err) {
                        print(err);
                      });
                      isPlaying = true;
                    }
                    else if(audioManagerInstance.isPlaying){
                      isPlaying = false;
                      audioManagerInstance.toPause();
                    }
                    else if(_slider!=0)
                      {
                        isPlaying = true;
                        audioManagerInstance.toPlay();
                      }
                  },
                  padding: const EdgeInsets.all(0.0),
                  icon: Icon(
                    audioManagerInstance.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.cyan.withOpacity(0.3),
              child: Center(
                child: IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.white,
                    ),
                    onPressed: () => audioManagerInstance.next()),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

var audioManagerInstance = AudioManager.instance;
PlayMode playMode = audioManagerInstance.playMode;
double _slider;
