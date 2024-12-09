import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    tz.initializeTimeZones();

    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
    );

    const initializationSettings = InitializationSettings(
      iOS: iosSettings,
    );

    // Inicializar plugin
    await _notifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Manipular quando a notificação é tocada
        print('Notificação tocada: ${details.payload}');
      },
    );

    // Solicitar permissões no iOS
    await _requestIOSPermissions();
  }

  static Future<void> _requestIOSPermissions() async {
    await _notifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static Future<void> showNotification({
    required String title,
    required String body,
    required int seconds,
  }) async {
    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final notificationDetails = NotificationDetails(
      iOS: iosDetails,
    );

    final scheduledDate =
        tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds));

    try {
      await _notifications.zonedSchedule(
        0,
        title,
        body,
        scheduledDate,
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
      print('Notificação agendada com sucesso');
    } catch (e) {
      print('Erro ao agendar notificação: $e');
    }
  }

  // Método para enviar notificação imediata (útil para testes)
  static Future<void> showImmediateNotification({
    required String title,
    required String body,
  }) async {
    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final notificationDetails = NotificationDetails(
      iOS: iosDetails,
    );

    try {
      await _notifications.show(
        0,
        title,
        body,
        notificationDetails,
      );
      print('Notificação imediata enviada com sucesso');
    } catch (e) {
      print('Erro ao enviar notificação imediata: $e');
    }
  }
}
