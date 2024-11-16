import 'package:navigation/navigation.dart';
import 'auth.gm.dart';

export 'package:auth/auth.dart';
export 'src/presentation/pages/sign_in_page.dart';
export 'src/presentation/pages/sign_up_page.dart';

@AutoRouterConfig.module()
class AuthModule extends $AuthModule {}