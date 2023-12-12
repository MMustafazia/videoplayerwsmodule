import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:videoplayerws/screen/folders/videofolder.dart';
import 'package:videoplayerws/screen/folders/whatsappvideofolder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => VideoFolderPage()));
                },
                child: Container(
                  height: 180,
                  width: 180,
                  child: Column(
                    children: [
                      Icon(
                        Icons.folder,
                        size: 120,
                        color: Colors.grey,
                      ),
                      Text("Videos")
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => WBFolderPage()));
                },
                child: Container(
                  height: 180,
                  width: 180,
                  child: Column(
                    children: [
                      Icon(
                        Icons.folder,
                        size: 120,
                        color: Colors.grey,
                      ),
                      Text("WhatsApp Videos")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:videoplayerws/provider/getvideoprovider.dart';
// import 'package:videoplayerws/screen/player.dart';
// import 'package:videoplayerws/utils/getthumbnail.dart';

// class VideoHomePage extends StatefulWidget {
//   const VideoHomePage({super.key});

//   @override
//   State<VideoHomePage> createState() => _VideoHomePageState();
// }

// class _VideoHomePageState extends State<VideoHomePage> {
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   Provider.of<GetStatusProvider>(context, listen: false).getStatus();
//   // }
//   bool _isFetched = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Video Player"),
//       ),
//       body: Consumer<GetStatusProvider>(builder: (context, file, child) {
//         if (_isFetched == false) {
//           file.getStatus(".mp4");
//           Future.delayed(Duration(microseconds: 1), () {
//             _isFetched = true;
//           });
//         }
//         return file.isWhatsAppAvailable == false
//             ? Center(
//                 child: Text("Video Data Not Available!"),
//               )
//             : file.getVideos.isEmpty
//                 ? Center(
//                     child: Text("No Video Data Found"),
//                   )
//                 : Container(
//                     padding: EdgeInsets.all(20),
//                     child: GridView(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: 8,
//                             mainAxisSpacing: 8),
//                         children: List.generate(file.getVideos.length, (index) {
//                           final data = file.getVideos[index];
//                           return FutureBuilder<String>(
//                               future: getThumbnail(data.path),
//                               builder: (context, snapshot) {
//                                 return snapshot.hasData
//                                     ? GestureDetector(
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             CupertinoPageRoute(
//                                                 builder: (_) => VideoView(
//                                                       videoPath: data.path,
//                                                       aspectRatio: 16 / 9,
//                                                     )),
//                                           );
//                                         },
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               color: Colors.amber,
//                                               image: DecorationImage(
//                                                   fit: BoxFit.cover,
//                                                   image: FileImage(File(
//                                                     snapshot.data!,
//                                                   ))),
//                                               borderRadius:
//                                                   BorderRadius.circular(10)),
//                                         ),
//                                       )
//                                     : const Center(
//                                         child: CircularProgressIndicator(),
//                                       );
//                               });
//                         })),
//                   );
//       }),
//     );
//   }
// }
