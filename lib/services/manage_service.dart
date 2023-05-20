import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:smart_parking/models/my_model.dart';

class ManagementService {
  static final refDb = FirebaseDatabase.instance.ref();

  Future<bool> updateStatus(
    bool value,
  ) async {
    try {
      await refDb.update({
        'barrier': !value,
      });
    } catch (e) {
      rethrow;
    }

    return value;
  }

  Future<void> readHistory(List<History> listReal, List<String?> date) async {
    try {
      ManagementService.refDb.child('history').onValue.listen(
        (event) {
          var snapshot = event.snapshot.value;
          List<dynamic> listData = snapshot as List;
          listReal = [];
          date = [];

          if (snapshot != null) {
            for (var list in listData) {
              History history = History.fromJson(list as Map);
              if (history != null) {
                date.add(DateFormat('yyyy-MM-dd')
                    .format(DateTime.parse(history.datetime!)));
              }
              listReal.add(history);
            }

            listReal.sort((b, a) => DateTime.parse(a.datetime!)
                .compareTo(DateTime.parse(b.datetime!)));
            date = date.toSet().toList();
            print(date);
          }
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
