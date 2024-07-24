import 'package:get/get.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'email_hint': 'Enter Email',
      'password_hint': 'Enter Password',
      'login_button': 'Login',
      'signup_button': 'Sign Up',
      // Add all other translations here
    },
    'ur_PK': {
      'email_hint': 'ای میل درج کریں',
      'password_hint': 'پاس ورڈ درج کریں',
      'login_button': 'لاگ ان کریں',
      'signup_button': 'سائن اپ کریں',
      // Add all other translations here
    },
  };
}
