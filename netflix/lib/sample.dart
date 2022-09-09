// import 'dart:developer';

// import 'package:flutter/material.dart';

// import 'package:netflix/Application/fast_Laugh/fastlaugh_bloc.dart';
// import 'package:netflix/Domain/downloads/models/downloads.dart';
// import 'package:netflix/core/colors/colors.dart';
// import 'package:netflix/core/constants.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:video_player/video_player.dart';

// class VideoListItemInheritedWidget extends InheritedWidget {
//   final Widget widget;
//   final Downloads movieData;

//   const VideoListItemInheritedWidget({
//     Key? key,
//     required this.widget,
//     required this.movieData,
//   }) : super(key: key, child: widget);
//   @override
//   bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
//     return oldWidget.movieData != movieData;
//   }

//   static VideoListItemInheritedWidget? of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
//   }
// }

// class VideoListItem extends StatelessWidget {
//   final int index;
//   //  final VideoPlayerController videoPlayerController;
//    const VideoListItem({Key? key, required this.index, }) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
    
//     final posterPath =
//         VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
//     final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
//     return Stack(
//       children: [
//         FastLaughVideoPlayer(VideoUrl: videoUrl, onStateChanged: (bool) {}),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 //left side
//                 CircleAvatar(
//                     backgroundColor: Colors.black.withOpacity(.1),
//                     radius: 30,
//                     child: IconButton(
//                         onPressed: () {}, icon: const Icon(Icons.volume_off))),

//                 //  right side
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20),
//                       child: CircleAvatar(
//                         backgroundImage: posterPath == null
//                             ? null
//                             : NetworkImage('$imageappendUrl$posterPath'),
//                         radius: 25,
//                       ),
//                     ),



//                     ValueListenableBuilder(
//                         valueListenable: likedVideosIdsNotifier,
//                         builder: (BuildContext c, Set<int> newLikedListIds,
//                             Widget? _) {
//                           final _index_ = index;
//                           if (newLikedListIds.contains(_index_)) {
//                             return GestureDetector(
//                               onTap: () {
//                                 // BlocProvider.of<FastlaughBloc>(context)
//                                 // .add(UnLikeVideo(id: _index));
//                                 likedVideosIdsNotifier.value.remove(_index_);
//                                  likedVideosIdsNotifier.notifyListeners();
//                               },
//                               child: const VideoActionsWidget(
//                                 icon: Icons.favorite_outline,
//                                 title: 'Liked',
//                               ),
//                             );
//                           }

//                           return GestureDetector(
//                             onTap: () {
//                               // BlocProvider.of<FastlaughBloc>(context)
//                               // .add(LikeVideo(id: _index));
//                               likedVideosIdsNotifier.value.add(_index_);
//                                likedVideosIdsNotifier.notifyListeners();
//                             },
//                             child: const VideoActionsWidget(
//                               icon: Icons.thumb_up,
//                               title: 'Like',
//                             ),
//                           );
//                         }),



//                     const VideoActionsWidget(icon: Icons.add, title: 'My List'),
//                     GestureDetector(
//                         onTap: () {
//                           log('share clicked');
//                           final movieName =
//                               VideoListItemInheritedWidget.of(context)
//                                   ?.movieData
//                                   .title;
//                           log(movieName.toString());
//                           if (movieName != null) {
//                             Share.share(movieName);
//                           }
//                         },
//                         child: const VideoActionsWidget(
//                             icon: Icons.share, title: 'Share')),





//                     ValueListenableBuilder(
//                         valueListenable: pauseVideosIdsNotifier,
//                         builder: (BuildContext c, Set<int> playListIds,
//                             Widget? _) {
//                           final _index = index;
//                           if (playListIds.contains(_index)) {
//                             return GestureDetector(
//                               onTap: () {
                               
//                                 // pauseVideosIdsNotifier.value.remove(_index);
//                                 //  _videoPlayerController.value.isPlaying ? videoPlayerController.pause() : videoPlayerController.play();
//                               pauseVideosIdsNotifier.notifyListeners();
//                               },
//                               child: const VideoActionsWidget(
//                                 icon: Icons.play_arrow,
//                                 title: 'play',
//                               ),
//                             );
//                           }

//                           return GestureDetector(
//                             onTap: () {
//                                log("pause");
//                             // pauseVideosIdsNotifier.value.add(_index);
//                           videoPlayerController.value.isPlaying ? videoPlayerController.pause() : videoPlayerController.play();
//                                pauseVideosIdsNotifier.notifyListeners();
//                             },
//                             child: const VideoActionsWidget(
//                               icon: Icons.pause,
//                               title: 'pause',
//                             ),
//                           );
//                         }),
                      






                        
                        
//                   ],
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// class VideoActionsWidget extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   const VideoActionsWidget({Key? key, required this.icon, required this.title})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       child: Column(
//         children: [
//           Icon(
//             icon,
//             color: KwhiteColor,
//             size: 30,
//           ),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 16),
//           )
//         ],
//       ),
//     );
//   }
// }

// class FastLaughVideoPlayer extends StatefulWidget {
//   final String VideoUrl;
//   final void Function(bool isPlayeing) onStateChanged;
//   const FastLaughVideoPlayer(
//       {Key? key, required this.VideoUrl, required this.onStateChanged})
//       : super(key: key);

//   @override
//   State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
// }

// class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
//   late VideoPlayerController _videoPlayerController;

//   @override
//   void initState() {
//     _videoPlayerController = VideoPlayerController.network(widget.VideoUrl);
//     _videoPlayerController.initialize().then((value) {
//       setState(() {
//              if (_videoPlayerController.value.isPlaying) {
//               _videoPlayerController.pause();
//             } else {
//               // If the video is paused, play it.
//               _videoPlayerController.play();
//             }
//       });
      
     
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: double.infinity,
//       child: _videoPlayerController.value.isInitialized
//           ? AspectRatio(
//               aspectRatio: _videoPlayerController.value.aspectRatio,
//               child: VideoPlayer(_videoPlayerController),
//             )
//           : const Center(
//               child: CircularProgressIndicator(
//                 strokeWidth: 2,
//               ),
//             ),
            
//     );
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     super.dispose();
//   }
// }
