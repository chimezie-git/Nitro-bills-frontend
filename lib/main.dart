import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nitrobills/app/data/services/notification/notification_service.dart';
import 'package:nitrobills/app/ui/utils/nb_hive_box.dart';
import 'package:nitrobills/nitrobills.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await NotificationService.initNotification();
  // init hive boxes
  await Hive.initFlutter();
  await NbHiveBox.registerAdapters();
  // end init hive box

  runApp(const NitroBills());
}
