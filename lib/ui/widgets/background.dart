import 'dart:isolate';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:restaurant_app/data/api/api.dart';
import 'package:restaurant_app/main.dart';
import 'package:restaurant_app/ui/widgets/notification_helper.dart';

final ReceivePort port = ReceivePort();

class Background {
  static Background? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  Background._internal() {
    _instance = this;
  }

  factory Background() => _instance ?? Background._internal();
  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    debugPrint('Alarm fired!');
    final NotificationHelper _notificationHelper = NotificationHelper();
    var result = await Api(Client()).getData();
    await _notificationHelper.showNotification(
        flutterLocalNotificationsPlugin, result);
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
