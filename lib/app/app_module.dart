import 'package:clone_instagram/app/modules/auth/module/auth_module.dart';
import 'package:clone_instagram/app/modules/login/module/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/module/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: AuthModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}