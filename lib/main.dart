import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:katana_mobile/core/constants/palette.dart';
import 'package:katana_mobile/core/router/app_router.dart';
import 'package:katana_mobile/core/services/services_locator.dart';
import 'package:katana_mobile/features/presentation/login_cubit/login_cubit.dart';

import 'package:katana_mobile/features/presentation/pages/nlogin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

 var tokenBox = await Hive.openBox('tokenBox');


  setUpServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (context) {
    //       return LoginCubit();
    //     })
    //   ],
    //   child:
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          title: 'Login With Cubit',
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Palette.primary,
              appBarTheme: AppBarTheme(color: Palette.primary)),
        );
      },
    );
  }
}
