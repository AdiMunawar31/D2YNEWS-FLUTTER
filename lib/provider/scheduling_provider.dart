import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:d2ynews/utils/background_service.dart';
import 'package:d2ynews/utils/date_time_helper.dart';
import 'package:flutter/foundation.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isSchedule = false;

  bool get isSchedule => _isSchedule;

  Future<bool> scheduleNews(bool value) async {
    _isSchedule = value;
    if (_isSchedule) {
      print('Scheduling News Activated');
      notifyListeners();
      return await AndroidAlarmManager.periodic(
          Duration(hours: 24), 1, BackgroundService.callback,
          startAt: DateTimeHelper.format(), exact: true, wakeup: true);
    } else {
      print('Scheduling News Canceled');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
