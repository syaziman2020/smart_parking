import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_parking/controllers/manage_controller.dart';
import 'package:smart_parking/theme.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final manageC = Get.find<ManageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(15),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Gerbang',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Obx(() {
            if (manageC.statusControl != null) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: (manageC.statusControl.isTrue)
                      ? LinearGradient(
                          colors: [
                            blueCC.withOpacity(0.2),
                            blueCC.withOpacity(0.5),
                          ],
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                        )
                      : LinearGradient(
                          colors: [
                            Colors.red.withOpacity(0.2),
                            Colors.red.withOpacity(0.2),
                          ],
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                        ),
                ),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  iconSize: MediaQuery.of(context).size.width * 0.4,
                  onPressed: () {
                    manageC.updateStatus(manageC.statusControl.value);
                  },
                  icon: Icon(
                    Icons.power_settings_new_rounded,
                    color: (manageC.statusControl.isTrue) ? blueCA : Colors.red,
                    shadows: [
                      BoxShadow(
                        color: blueCB.withOpacity(0.5),
                        blurRadius: 40,
                      ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox();
          }),
          Obx(
            () {
              if (manageC.loadingCon.isFalse) {
                return Center(
                  child: CircularProgressIndicator(
                    color: blueCA,
                  ),
                );
              }
              return Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Status : ',
                      style: greyTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    TextSpan(
                      text: (manageC.statusControl.value)
                          ? 'Terbuka'
                          : 'Tertutup',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: blueCA,
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Tanggal : ',
                    style: greyTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  TextSpan(
                    text: '${DateFormat('dd/MM/yyyy').format(
                      DateTime.parse(DateTime.now().toString()),
                    )}',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
