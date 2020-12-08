import 'package:audio_manager/audio_manager.dart';
import 'package:burn_out/screens/SongsPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:burn_out/screens/SongsHome.dart';
// import 'package:burn_out/screens/SongsUpload.dart';
import 'package:music_player/music_player.dart';

var audioManagerInstance = AudioManager.instance;
PlayMode playMode = audioManagerInstance.playMode;
double _slider;

class SongsMain extends StatefulWidget {
  static const routeName = '/songsMainPage';
  @override
  _SongsMainState createState() => _SongsMainState();
}

class _SongsMainState extends State<SongsMain> {
  List<DocumentSnapshot> _list;
  int currentindex = 0;
  MusicPlayer musicPlayer;
  bool isPlaying = false;

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
          setState(() {});
          break;
        case AudioManagerEvents.playstatus:
          isPlaying = audioManagerInstance.isPlaying;
          setState(() {});
          break;
        case AudioManagerEvents.timeupdate:
          _slider = audioManagerInstance.position.inMilliseconds /
              audioManagerInstance.duration.inMilliseconds;
          audioManagerInstance.updateLrc(args["position"].toString());
          setState(() {});
          break;
        case AudioManagerEvents.ended:
          audioManagerInstance.next();
          setState(() {});
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

  var iconSong = Icons.play_circle_outline_rounded;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 112,
              child: Scaffold(
                backgroundColor: Color(0xFF03424F),
                appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: Color(0xFF53CA6B),
                  ),
                  title: Text(
                    "Songs",
                    style: TextStyle(
                      color: Color(0xFF53CA6B),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(220),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'images/logo.png',
                                  fit: BoxFit.contain,
                                  height: 130,
                                ),
                              ),
                              Container(
                                  width: 200,
                                  height: 100,
                                  child: Image(
                                      image: AssetImage(
                                        'images/run.png',
                                      ),
                                      height: 400)),
                            ],
                          ),
                          TabBar(
                            labelColor: Color(0xFF53CA6B),
                            tabs: [
                              Tab(
                                text: ('Hindi'),
                              ),
                              Tab(text: ('English')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('songs_hindi')
                          .orderBy('song_name')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          _list = snapshot.data.docs;
                          return ListView.custom(
                              childrenDelegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return buildList(context, _list[index]);
                            },
                            childCount: _list.length,
                          ));
                        }
                      },
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('songs_english')
                          .orderBy('song_name')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          _list = snapshot.data.docs;
                          return ListView.custom(
                              childrenDelegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return buildList(context, _list[index]);
                            },
                            childCount: _list.length,
                          ));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 112,
              color: Color(0xFF53CA6B),
              child: bottomPanel(),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildList(BuildContext context, DocumentSnapshot documentSnapshot) {
    var song_name = documentSnapshot.data()["song_name"];
    var artist_name = documentSnapshot.data()["artist_name"];
    var song_url = documentSnapshot.data()["song_url"];
    var image_url = documentSnapshot.data()["image_url"];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () => {Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => Songspage(
                  song_name: documentSnapshot.data()["song_name"],
                  artist_name: documentSnapshot.data()["artist_name"],
                  song_url: documentSnapshot.data()["song_url"],
                  image_url: documentSnapshot.data()["image_url"],
                  ))),
                },
              child: Card(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          documentSnapshot.data()["song_name"],
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF53CA6B),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      TextButton(
                        child:  Icon(iconSong, color: Color(0xFF53CA6B),size: 30,),
                        onPressed: () {
                          setState(() {
                            audioManagerInstance
                                .start(song_url, song_name,
                                desc: artist_name,
                                auto: true,
                                cover: image_url)
                                .then((err) {
                              print(err);
                            });
                            if(audioManagerInstance.isPlaying){
                              audioManagerInstance.playOrPause();
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                elevation: 0.0,
              ),
            ),
          ),
        ),
        Container(
          color: Color(0xFF53CA6B),
          margin: EdgeInsets.all(10.0),
          height: 2,
        ),
      ],
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
                  max: (audioManagerInstance.duration.inMilliseconds ?? 0.0).toDouble(),
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

  Widget bottomPanel(){
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
              backgroundColor: Colors.cyan.withOpacity(0.6),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF03424F),
              child: Center(
                child: IconButton(
                  onPressed: () async {
                    if (!audioManagerInstance.isPlaying && _slider == 0) {
                      isPlaying = true;
                    } else if (audioManagerInstance.isPlaying) {
                      isPlaying = false;
                      audioManagerInstance.toPause();
                    } else if (_slider != 0) {
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
              backgroundColor: Colors.cyan.withOpacity(0.6),
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
