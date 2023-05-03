import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/pages/login_page.dart';
import 'package:smart_parking/theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      width: double.infinity,
      padding: EdgeInsets.all(15),
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
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  blueCC.withOpacity(0.2),
                  blueCC.withOpacity(0.5),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
            ),
            child: IconButton(
              highlightColor: Colors.transparent,
              iconSize: MediaQuery.of(context).size.width * 0.4,
              onPressed: () {
                Get.defaultDialog(
                  barrierDismissible: false,
                  title: 'Masukkan nama pengunjung',
                  titleStyle: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 14),
                  titlePadding: const EdgeInsets.only(top: 15, bottom: 15),
                  radius: 20,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Nama',
                        textAlign: TextAlign.center,
                        style: greyTextStyle.copyWith(fontSize: 13),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        cursorColor: blueCA,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          hintText: 'Masukkan nama',
                          hintStyle: greyTextStyle.copyWith(
                            fontSize: 13,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: BorderSide(color: blueCA),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            borderSide: BorderSide(color: blueCA),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blueCA),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: blueCA,
                              ),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  confirm: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: buttonStyle().copyWith(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                      child: Text(
                        'Yakin',
                        style: whiteTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  cancel: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: buttonStyle().copyWith(
                        backgroundColor: MaterialStateProperty.all(greyC),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                      child: Text(
                        'Batal',
                        style: whiteTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(
                Icons.power_settings_new_rounded,
                color: blueCA,
                shadows: [
                  BoxShadow(
                    color: blueCB.withOpacity(0.5),
                    blurRadius: 40,
                  ),
                ],
              ),
            ),
          ),
          Text.rich(
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
                  text: 'Tertutup',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: blueCA,
          ),
          SizedBox(
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
                    text: '08/03/2023',
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
