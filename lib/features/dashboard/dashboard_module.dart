import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/features/dashboard/presenter/pages/dashboard_page.dart';

class DashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, __) => DashboardPage()),
      ];

  static Inject get to => Inject<DashboardModule>.of();
}
