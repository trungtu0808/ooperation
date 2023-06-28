import 'package:app_chat_firebase/import_file/import_all.dart';
import 'package:app_chat_firebase/notifications/core/service/notification_utils.dart';
import 'package:app_chat_firebase/notifications/domain/entity/notification_entity.dart';
import 'package:flutter/material.dart';

import 'data/model/notification_payload.dart';
import 'presentation/widget/app_notification.dart';

class NotificationsReceiver extends StatefulWidget {
  const NotificationsReceiver({
    Key? key,
    required this.appAutoRoute,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final AppAutoRoute appAutoRoute;

  @override
  State<NotificationsReceiver> createState() => _NotificationsReceiverState();
}

class _NotificationsReceiverState extends State<NotificationsReceiver> {
  @override
  void initState() {
    super.initState();
    _initService();
  }

  BuildContext? _findCurrentContext() {
    return Get.find<GlobalKey<NavigatorState>>().currentContext;
  }

  void _initService() async {
    var localNotificationService = Get.find<LocalNotificationService>();
    await localNotificationService.init(notificationPressedCallBack: _onNotificationTab);
    FirebaseNotificationService.instance.init(
      notificationPressedCallBack: _onNotificationTab,
      filterMessage: _filterNotification,
      localNotification: localNotificationService,
    );
  }

  void _onNotificationTab(Map<String, dynamic>? data) {
    if (data == null) {
      return;
    }
    try {
      final payload = NotificationPayload.fromJson(data);
      if (payload is NotificationSignInPayLoad) {
        _handleResponseSignInAccount(payload);
      }
      final notification = NotificationEntity.fromJson(data);
      if (_findCurrentContext() == null) {
        return;
      }
      NotificationsUtils.onNotificationTab(
        context: _findCurrentContext()!,
        notificationEntity: notification,
        markAsRead: true,
      );
    } catch (e) {
      logger.e(e);
    }
  }

  FilterMessageResult _filterNotification({
    Map<String, dynamic>? data,
    RemoteNotification? notification,
  }) {
    if (data == null) {
      return FilterMessageResult.skipped;
    }

    final payload = NotificationPayload.fromJson(data);
    if (payload is NotificationSignInPayLoad) {
      _handleResponseSignInAccount(payload);
      return FilterMessageResult.consumed;
    }
    final title = notification?.title ?? '';
    if (title.isEmpty) {
      return FilterMessageResult.skipped;
    }
    _showInAppNotification(
      jsonData: data,
      title: title,
      subtitle: notification?.body,
    );

    return FilterMessageResult.consumed;
  }

  void _showInAppNotification({
    required Map<String, dynamic> jsonData,
    required String title,
    required String? subtitle,
  }) async {
    showOverlayNotification(
      (context) {
        return AppNotification(
          title: title,
          subtitle: subtitle,
          onPressed: () {
            OverlaySupportEntry.of(context)?.dismiss();
            _onNotificationTab(jsonData);
          },
        );
      },
    );
  }

  void _handleResponseSignInAccount(NotificationSignInPayLoad payload) {
    logger.e(payload);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}