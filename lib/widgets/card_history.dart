import 'package:flutter/material.dart';
import 'package:smart_parking/theme.dart';

class CardHistory extends StatelessWidget {
  const CardHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(
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
                'Uray Wijaya',
                style: blackTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: blueCA.withOpacity(0.5),
          ),
          SizedBox(
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
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '12/03/2023',
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
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '08:00',
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
