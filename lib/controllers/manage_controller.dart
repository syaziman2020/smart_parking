import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:smart_parking/models/my_model.dart';
import 'package:smart_parking/pages/login_page.dart';
import 'package:smart_parking/pages/main_page.dart';
import 'package:smart_parking/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking/services/manage_service.dart';
import '../theme.dart';

class ManageController extends GetxController {
  RxString errorMessage = ''.obs;
  RxBool isLogin = true.obs;
  RxBool isUpdate = true.obs;
  RxBool statusLogin = false.obs;
  RxBool statusCon = true.obs;
  RxBool loadingCon = true.obs;
  RxBool statusControl = false.obs;
  RxString emailC = ''.obs;
  RxBool isLoadingOut = true.obs;
  RxBool isLogout = true.obs;

  void loginAcc(String email, String pass) async {
    try {
      if (email == "" || pass == "") {
        errorMessage('Silakan periksa kembali email dan password anda');
        statusLogin.value = false;
        Get.defaultDialog(
          barrierDismissible: false,
          title: 'Terjadi Kesalahan',
          titleStyle:
              blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          titlePadding: const EdgeInsets.only(top: 15, bottom: 20),
          radius: 10,
          contentPadding: const EdgeInsets.symmetric(horizontal: 22),
          content: Column(
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$errorMessage',
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
          confirm: Container(
            margin: const EdgeInsets.only(bottom: 15),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                isLogin.value = true;
                print(isLogin.value);
                Get.back();
              },
              style: buttonStyle().copyWith(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 10),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Text(
                'Oke!!',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        );
        return;
      }
      isLogin(false);
      bool result = await AuthService().signIn(email: email, password: pass);
      if (result == true) {
        isLogin.value = true;
        statusLogin.value = true;
        emailC(email);
        if (statusLogin.isTrue) {
          Get.off(() => MainPage());
        }
      } else {
        isLogin.value = true;

        errorMessage('Silakan periksa kembali email dan password anda');
        statusLogin.value = false;
        Get.defaultDialog(
          barrierDismissible: false,
          title: 'Terjadi Kesalahan',
          titleStyle:
              blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          titlePadding: const EdgeInsets.only(top: 15, bottom: 20),
          radius: 10,
          contentPadding: const EdgeInsets.symmetric(horizontal: 22),
          content: Column(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '$errorMessage',
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
          confirm: Container(
            margin: const EdgeInsets.only(bottom: 15),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                isLogin.value = true;
                print(isLogin.value);
                Get.back();
              },
              style: buttonStyle().copyWith(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 10),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Text(
                'Oke!!',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        );
        if (kDebugMode) {
          print('xx');
        }
      }
    } catch (e) {
      isLogin.value = true;
      errorMessage('Silakan periksa kembali koneksi internet anda');
      statusLogin.value = false;
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'Terjadi Kesalahan',
        titleStyle: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
        titlePadding: const EdgeInsets.only(top: 15, bottom: 20),
        radius: 10,
        contentPadding: const EdgeInsets.symmetric(horizontal: 22),
        content: Column(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$errorMessage',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontSize: 13),
            ),
          ],
        ),
        confirm: Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              isLogin.value = true;
              print(isLogin.value);
              Get.back();
            },
            style: buttonStyle().copyWith(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            child: Text(
              'Oke!!',
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 13,
              ),
            ),
          ),
        ),
      );
    }
  }

  Future<void> updateStatus(bool barrier) async {
    try {
      isUpdate(false);
      print('hello');
      await ManagementService().updateStatus(
        barrier,
      );
      isUpdate(true);
    } catch (e) {
      rethrow;
    }
  }

  void readControl() async {
    try {
      loadingCon(false);
      print('jalann');
      ManagementService.refDb.child('barrier').onValue.listen((event) {
        print('in listen');
        var snapshot = event.snapshot.value;
        print(snapshot);
        if (snapshot != null) {
          statusControl.value = snapshot as bool;
          if (statusControl != null) {
            loadingCon(true);
          } else {
            Get.defaultDialog(
              barrierDismissible: false,
              title: 'Terjadi Kesalahan',
              titleStyle:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
              titlePadding: const EdgeInsets.only(top: 15, bottom: 20),
              radius: 10,
              contentPadding: const EdgeInsets.symmetric(horizontal: 22),
              content: Column(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$errorMessage',
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(fontSize: 13),
                  ),
                ],
              ),
              confirm: Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    loadingCon.value = true;

                    Get.back();
                  },
                  style: buttonStyle().copyWith(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 10),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Text(
                    'Oke!!',
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            );
          }
        } else {
          Get.defaultDialog(
            barrierDismissible: false,
            title: 'Terjadi Kesalahan',
            titleStyle:
                blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
            titlePadding: const EdgeInsets.only(top: 15, bottom: 20),
            radius: 10,
            contentPadding: const EdgeInsets.symmetric(horizontal: 22),
            content: Column(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '$errorMessage',
                  textAlign: TextAlign.center,
                  style: greyTextStyle.copyWith(fontSize: 13),
                ),
              ],
            ),
            confirm: Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  loadingCon.value = true;

                  Get.back();
                },
                style: buttonStyle().copyWith(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 10),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text(
                  'Oke!!',
                  style: whiteTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }
      });
    } catch (e) {
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'Terjadi Kesalahan',
        titleStyle: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
        titlePadding: const EdgeInsets.only(top: 15, bottom: 20),
        radius: 10,
        contentPadding: const EdgeInsets.symmetric(horizontal: 22),
        content: Column(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$errorMessage',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontSize: 13),
            ),
          ],
        ),
        confirm: Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              loadingCon.value = true;

              Get.back();
            },
            style: buttonStyle().copyWith(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            child: Text(
              'Oke!!',
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 13,
              ),
            ),
          ),
        ),
      );
    }
  }

  void logOut() async {
    try {
      isLoadingOut(false);
      await AuthService().signOut();
      print('berhasil logout');
      isLoadingOut(true);
      if (isLoadingOut.isTrue) {
        Get.offAll(() => LoginPage());
      }
    } catch (e) {
      errorMessage('Silakan periksa kembali koneksi internet anda');

      Get.defaultDialog(
        barrierDismissible: false,
        title: 'Terjadi Kesalahan',
        titleStyle: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
        titlePadding: const EdgeInsets.only(top: 15, bottom: 20),
        radius: 10,
        contentPadding: const EdgeInsets.symmetric(horizontal: 22),
        content: Column(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$errorMessage',
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontSize: 13),
            ),
          ],
        ),
        confirm: Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: buttonStyle().copyWith(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 10),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            child: Text(
              'Oke!!',
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 13,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  void onInit() {
    readControl();
    super.onInit();
  }
}
