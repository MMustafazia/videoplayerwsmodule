import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:videoplayerws/conts/constant.dart';

class GetStatusProvider extends ChangeNotifier {
  List<FileSystemEntity> _getImages = [];
  List<FileSystemEntity> _getVideos = [];
  List<FileSystemEntity> _getWBVideos = [];

  bool _isWhatsAppAvailable = false;

  List<FileSystemEntity> get getImages => _getImages;
  List<FileSystemEntity> get getVideos => _getVideos;
  List<FileSystemEntity> get getWBVideos => _getWBVideos;

  bool get isWhatsAppAvailable => _isWhatsAppAvailable;
  void getStatus(String ext) async {
    final status = await Permission.storage.request();
    // List<Directory>? directory = await getExternalStorageDirectories();
    if (status.isDenied) {
      Permission.storage.request();
      print("permission denied");
      return;
    }
    if (status.isGranted) {
      // if (directory != null) {
      //   for (Directory dir in directory) {
      //     print(dir.path);
      //   }
      // }
      final directory = Directory(Constant.VIDEO_FOLDER_PATH);
      final wbdirectory = Directory(Constant.WHATSAPP_VIDEO_FOLDER_PATH);
      if (directory.existsSync()) {
        final itemsWS = directory.listSync();

        if (ext == ".mp4") {
          _getVideos = itemsWS
              .where((element) => element.path.endsWith(".mp4"))
              .toList();
          notifyListeners();
        } else {
          // _getImages = itemsWS
          //     .where((element) => element.path.endsWith(".jpg"))
          //     .toList();
          // notifyListeners();
        }

        _isWhatsAppAvailable = true;
        notifyListeners();

        print(itemsWS.toString());
      } else {
        print("no Video data found");
        _isWhatsAppAvailable = false;
        notifyListeners();
      }
      if (wbdirectory.existsSync()) {
        final itemsWb = wbdirectory.listSync();

        if (ext == ".mp4") {
          _getWBVideos = itemsWb
              .where((element) => element.path.endsWith(".mp4"))
              .toList();
          notifyListeners();
        } else {
          // _getImages = itemsWS
          //     .where((element) => element.path.endsWith(".jpg"))
          //     .toList();
          // notifyListeners();
        }

        _isWhatsAppAvailable = true;
        notifyListeners();

        print(itemsWb.toString());
      } else {
        print("no Video data found");
        _isWhatsAppAvailable = false;
        notifyListeners();
      }
    }
  }
}
