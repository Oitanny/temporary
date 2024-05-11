import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sociio/models/user_model.dart';

class UserProvider extends InheritedWidget {
  final User? user;

  const UserProvider({Key? key, required this.user, required Widget child}) : super(key: key, child: child);

  static UserProvider of(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    if (provider == null) {
      throw Exception('UserProvider not found in context');
    }
    return provider;
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return user != oldWidget.user;
  }
}
