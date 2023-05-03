import 'package:flutter/material.dart';
import 'package:smart_parking/pages/main/dashboard_page.dart';

import '../theme.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget contentHeader() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height / 15,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 50),
            child: Image.asset(
              'assets/smarking.png',
              width: size.width * 0.4,
            ),
          ),
          Text(
            "Masuk Sebagai Admin",
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Masukkan email dan password anda yang sudah terdaftar sebagai admin",
            textAlign: TextAlign.center,
            style: greyTextStyle.copyWith(
              fontSize: 14,
              height: 1.8,
            ),
          ),
        ],
      );
    }

    Widget formWithButton() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height / 24,
          ),
          Text(
            'Email',
            style: greyTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            child: TextFormField(
              controller: _emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              cursorColor: blueCA,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Masukkan email anda',
                hintStyle: greyTextStyle.copyWith(
                  fontSize: 13,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  borderSide: BorderSide(color: blueCB),
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
          ),
          Text(
            'Password',
            style: greyTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: double.infinity,
            child: TextFormField(
              controller: _passController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              cursorColor: blueCA,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye_rounded,
                    size: 23,
                    color: greyC,
                  ),
                  onPressed: () {},
                ),
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Masukkan Password anda',
                hintStyle: greyTextStyle.copyWith(
                  fontSize: 13,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  borderSide: BorderSide(color: blueCB),
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
          ),
          SizedBox(
            height: size.height / 15,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: blueCB,
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                ),
              ),
              child: Text(
                'Masuk',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 20, 22, 0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            contentHeader(),
            formWithButton(),
          ],
        ),
      ),
    );
  }
}
