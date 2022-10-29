import 'package:firstproject/presentation/resources/languge_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String Prefs_Key_Lang = "Prefs_Key_Lang";

class AppPrefreneces {
  final SharedPreferences _sharedPreferences;

  AppPrefreneces(this._sharedPreferences);
  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(Prefs_Key_Lang);

    //   To avoiding null value or user not set first language so we make this if condition
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return langaugeType.ENGLISH.getValue();
    }
  }
}
