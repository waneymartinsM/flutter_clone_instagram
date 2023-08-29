import 'package:clone_instagram/app/modules/auth/store/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final controller = Modular.get<AuthStore>();

  @override
  void initState() {
    super.initState();
    _loading();
  }

  void _loading() async {
    await Future.delayed(const Duration(seconds: 2));
    controller.verifyLoggedUser();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Center(
                child: Image(
                    image: AssetImage('assets/images/icone.png'),
                    height: 110,
                    width: 110),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Image(
                    image: AssetImage('assets/images/meta_instagram.png'),
                    width: 150),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
