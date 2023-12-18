import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late final SharedPreferences shard;

  static void initialize() async {
    SharedPref.shard = await SharedPreferences.getInstance();
    SharedPref.shard.setInt('endtime1',
        (DateTime.now().millisecondsSinceEpoch +  1000 * 30).toInt());
    SharedPref.shard.setInt('endtime2',
        (DateTime.now().millisecondsSinceEpoch + 1200 * 30).toInt());
    SharedPref.shard.setInt('endtime3',
        (DateTime.now().millisecondsSinceEpoch + 120050 * 30).toInt());
    SharedPref.shard.setInt('endtime4',
        (DateTime.now().millisecondsSinceEpoch + 360150 * 30).toInt());
    SharedPref.shard.setInt('endtime5',
        (DateTime.now().millisecondsSinceEpoch + 720300 * 30).toInt());

  }
}
