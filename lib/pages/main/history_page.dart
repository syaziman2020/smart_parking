import 'package:flutter/material.dart';
import 'package:smart_parking/theme.dart';
import 'package:smart_parking/widgets/card_history.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Data Riwayat',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          for (int i = 0; i < 5; i++) ...{
            CardHistory(),
          },
        ],
      ),
    );
  }
}
