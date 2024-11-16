import 'package:auth/auth.dart';
import 'package:auth/auth.gm.dart';
import 'package:home/home.dart';
import 'package:home/home.gm.dart';

import '../../navigation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: <Type>[
    HomeModule,
    AuthModule,
  ],
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
        ),
        AutoRoute(
          page: SignInRoute.page,
          path: '/sign_in',
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: '/sign_up',
        ),
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
          path: '/splash',
        ),
      ];
}
