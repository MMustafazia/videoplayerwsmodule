import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayerws/provider/getvideoprovider.dart';
import 'package:videoplayerws/screen/player.dart';
import 'package:videoplayerws/utils/getthumbnail.dart';

class VideoFolderPage extends StatefulWidget {
  const VideoFolderPage({super.key});

  @override
  State<VideoFolderPage> createState() => _VideoFolderPageState();
}

class _VideoFolderPageState extends State<VideoFolderPage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<GetStatusProvider>(context, listen: false).getStatus();
  // }
  bool _isFetched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos Folder"),
      ),
      body: Consumer<GetStatusProvider>(builder: (context, file, child) {
        if (_isFetched == false) {
          file.getStatus(".mp4");
          Future.delayed(Duration(microseconds: 1), () {
            _isFetched = true;
          });
        }
        return file.isWhatsAppAvailable == false
            ? Center(
                child: Text("Video Data Not Available!"),
              )
            : file.getVideos.isEmpty
                ? Center(
                    child: Text("No Video Data Found"),
                  )
                : Container(
                    padding: EdgeInsets.all(20),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                        children: List.generate(file.getVideos.length, (index) {
                          final data = file.getVideos[index];
                          return FutureBuilder<String>(
                              future: getThumbnail(data.path),
                              builder: (context, snapshot) {
                                return snapshot.hasData
                                    ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (_) => VideoView(
                                                      videoPath: data.path,
                                                      aspectRatio: 16 / 9,
                                                    )),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: FileImage(File(
                                                    snapshot.data!,
                                                  ))),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator(),
                                      );
                              });
                        })),
                  );
      }),
    );
  }
}
