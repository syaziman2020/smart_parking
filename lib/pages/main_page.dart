import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_parking/controllers/widget_controller.dart';
import 'package:smart_parking/pages/login_page.dart';
import 'package:smart_parking/pages/main/dashboard_page.dart';
import 'package:smart_parking/pages/main/history_page.dart';

import '../theme.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final widgetC = Get.find<WidgetController>();

  @override
  Widget build(BuildContext context) {
    Widget body(int index) {
      switch (index) {
        case 0:
          return DashboardPage();
        case 1:
          return HistoryPage();
        default:
          return DashboardPage();
      }
    }

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
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: blueCA,
            ),
          ),
        ),
      ),
      body: Obx(() {
        return body(widgetC.currentIndex.value);
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedLabelStyle: blueTextStyle,
          selectedItemColor: blueCA,
          unselectedLabelStyle: greyTextStyle,
          currentIndex: widgetC.currentIndex.value,
          elevation: 8,
          onTap: (value) {
            widgetC.currentIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'History',
              icon: Icon(
                Icons.history,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
