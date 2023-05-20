import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_parking/models/my_model.dart';
import 'package:smart_parking/services/manage_service.dart';

class HistoryController extends GetxController {
  RxBool isHistory = true.obs;
  RxBool statusHistory = false.obs;
  RxList<History> listHistory = <History>[].obs;

  RxList<String> dateHistory = <String>[].obs;

  void historyData() async {
    try {
      if (kDebugMode) {
        print('hellllo');
      }
      isHistory(false);
      ManagementService.refDb.child('history').onValue.listen(
        (event) {
          listHistory.clear();
          var snapshot = event.snapshot.value;
          Map<String, dynamic> historyMap = {};

          (snapshot as Map).forEach((key, value) {
            String stringKey = key.toString();

            Map<String, dynamic> entry = {};
            value.forEach((subKey, subValue) {
              String stringSubKey = subKey.toString();
              dynamic dynamicValue = subValue;

              entry[stringSubKey] = dynamicValue;
            });

            historyMap[stringKey] = entry;
          });

          Map<String, dynamic> historyM = historyMap;

          List<dynamic> listData = historyM.values.toList();

          if (snapshot != null) {
            for (var list in listData) {
              History history = History.fromJson(list as Map);
              if (history != null) {
                dateHistory.add(DateFormat('yyyy-MM-dd')
                    .format(DateTime.parse(history.datetime!)));
                listHistory.add(history);
              }
            }

            listHistory.sort((b, a) => DateTime.parse(a.datetime!)
                .compareTo(DateTime.parse(b.datetime!)));
            dateHistory = dateHistory..toSet().toList();
            if (kDebugMode) {
              print(dateHistory);
            }
          }
        },
      );

      isHistory(true);

      if (isHistory.isTrue) {
        statusHistory.isTrue;
      }
    } catch (e) {
      statusHistory.value = false;
    }
  }

  @override
  void onInit() {
    historyData();
    super.onInit();
  }

  @override
  void dispose() {
    historyData();
    super.dispose();
  }
}
