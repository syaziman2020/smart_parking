import 'package:flutter/material.dart';
import 'package:smart_parking/theme.dart';

class CardHistory extends StatelessWidget {
  CardHistory({
    super.key,
    required this.date,
    required this.time,
    required this.name,
  });

  final String name;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: whiteC,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: blueCB.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(1, 1),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: blueCA,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$name',
                style: blackTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Divider(
            color: blueCA.withOpacity(0.5),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: blueCA,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal',
                        style: greyTextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$date',
                        style: blackTextStyle.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: blueCA,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Waktu',
                        style: greyTextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '$time',
                        style: blackTextStyle.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
