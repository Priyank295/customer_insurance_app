import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'select': 'Select Your Preferred Language',
          'find': 'Find a langauge',
          'next': 'Next',
          'have': 'Don\'t have an account?',
          'signUp': 'Sign Up',
        },
        'ar_AR': {
          'select': 'حدد لغتك المفضلة',
          'find': 'ابحث عن لغة',
          'next': 'التالي',
          'have': 'ليس لديك حساب؟',
          'signUp': 'اشتراك',
        },
      };
}
