import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> mostrar() async {
  
  const AndroidNotificationDetails androidNotificationDetails =
  AndroidNotificationDetails('channel_id', 'your_channel_ame');

const NotificationDetails notificationDetails = NotificationDetails(
android: androidNotificationDetails,
);

await flutterLocalNotificationsPlugin.show(1, 'Tarea agregada', 'Su tarea fue exitosamente agregada al firebase', 
notificationDetails);
}
