import 'package:get/get.dart';
import 'package:trilochanaa_app/language/arabic.dart';
import 'package:trilochanaa_app/language/bangla.dart';
import 'package:trilochanaa_app/language/english.dart';
import 'package:trilochanaa_app/language/french.dart';
import 'package:trilochanaa_app/language/german.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'bn_BD': bangla,
        'de_DE': german,
        'fr_FR': french,
        'ar_AR': arabic,
      };
}
