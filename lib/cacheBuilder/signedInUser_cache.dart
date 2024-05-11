import 'package:shared_preferences/shared_preferences.dart';
import 'package:sociio/models/user_model.dart';


Future<void> storeSignedInUser(User user) async {
  final prefs = await SharedPreferences.getInstance();

  // Store user data using appropriate data types
  await prefs.setString('uid', user.uid);
  await prefs.setString('uname', user.uname);
  await prefs.setString('uemail', user.uemail);
  await prefs.setString('uphone', user.uphone);
  await prefs.setString('ugender', user.ugender);
  await prefs.setString('ubio', user.ubio);
  await prefs.setString('uavatar', user.uavatar);

  print('User successfully stored in local cache.'); // Optional for debugging
}

Future<User?> getSignedInUser() async {
  final prefs = await SharedPreferences.getInstance();

  final uid = prefs.getString('uid');
  final uname = prefs.getString('uname');
  final uemail = prefs.getString('uemail');
  final uphone = prefs.getString('uphone');
  final ugender = prefs.getString('ugender');
  final ubio = prefs.getString('ubio');
  final uavatar = prefs.getString('uavatar');

  if (uid != null &&
      uname != null &&
      uemail != null &&
      uphone != null &&
      ugender != null &&
      ubio != null &&
      uavatar != null) {
    return User(
      uid: uid,
      uname: uname,
      uemail: uemail,
      uphone: uphone,
      ugender: ugender,
      ubio: ubio,
      uavatar: uavatar,
    );
  } else {
    return null;
  }
}
Future<void> clearSignedInUser() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('uid');
  await prefs.remove('uname');
  await prefs.remove('uemail');
  await prefs.remove('uphone');
  await prefs.remove('ugender');
  await prefs.remove('ubio');
  await prefs.remove('uavatar');
}

