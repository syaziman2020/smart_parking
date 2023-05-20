import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_parking/controllers/history_controller.dart';
import 'package:smart_parking/theme.dart';
import 'package:smart_parking/widgets/card_history.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final historyC = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Data Riwayat',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            if (historyC.isHistory.isFalse) {
              return Center(
                child: CircularProgressIndicator(
                  color: blueCA,
                ),
              );
            } else if (historyC.listHistory.isNotEmpty) {
              return Column(
                children: [
                  ...historyC.listHistory.map(
                    (e) => CardHistory(
                      name: e.name ?? 'loading...',
                      date: DateFormat('dd/MM/yyyy').format(
                        DateTime.parse(e.datetime ?? DateTime.now().toString()),
                      ),
                      time: DateFormat.jm().format(DateTime.parse(
                          e.datetime ?? DateTime.now().toString())),
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: Text(
                'Data Kosong',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
