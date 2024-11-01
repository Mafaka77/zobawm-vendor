import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zobawm_vendor_app/components/my_colors.dart';
import 'package:zobawm_vendor_app/routes/router.dart';
import 'package:zobawm_vendor_app/services/auth_services.dart';
import 'package:zobawm_vendor_app/services/register_services.dart';

final storage = GetStorage();
void main() {
  runApp(const MyApp());
  Get.put(AuthServices(), tag: 'authServices');
  Get.put(RegisterServices(), tag: 'registerServices');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: FlexThemeData.light(
        scheme: FlexScheme.blue,
        appBarElevation: 0,
        appBarStyle: FlexAppBarStyle.material,
        scaffoldBackground: const Color.fromARGB(246, 248, 255, 255),
        colorScheme: ColorScheme.light(
          surface: const Color.fromARGB(255, 196, 196, 196),
          primary: MyColors.blue,
        ),
        fontFamily: ' Roboto-Regular',
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/login-screen',
      getPages: pages,
    );
  }
}
