import 'package:flutter/material.dart';
import 'package:smart_parking/pages/login_page.dart';
import 'package:smart_parking/theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Welcome Uray',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            color: blackC,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: blueCA,
            ),
          ),
          preferredSize: Size.fromHeight(3),
        ),
      ),
      body: Container(
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
              'Gerbang Keluar',
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
                onPressed: () {},
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
      ),
    );
  }
}
