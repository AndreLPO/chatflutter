import 'package:chatflutter/modules/Cadastro/cadastro_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastroModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const CadastroPage())];
}
