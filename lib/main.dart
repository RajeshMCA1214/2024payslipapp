import 'package:flutter/material.dart';
import 'package:trilochanaa_app/routes/routes.dart';
import 'package:get/get.dart';
import 'Controllers/global-controller.dart';
import 'package:get_storage/get_storage.dart';
import '../../language/language.dart';
import 'package:firebase_core/firebase_core.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  dynamic langValue = const Locale('en', 'US');
  if (box.read('lang') != null) {
    langValue = Locale(box.read('lang'), box.read('langKey'));
  } else {
    langValue = const Locale('en', 'US');
  }
  runApp(VisitorPass(langValue: langValue));
}

class VisitorPass extends StatelessWidget {
  final dynamic langValue;
  VisitorPass({Key? key, this.langValue}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController()).onInit();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visitor Pass Solution',
      translations: Languages(),
      locale: langValue,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: AppColor.primaryColor,
      ),
      initialRoute: "/",
      getPages: Routes.pages,
    );
  }
}
