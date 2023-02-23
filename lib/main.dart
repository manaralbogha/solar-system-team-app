import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/home_solar_system_team_screen/cubit/cubit.dart';
import 'layout/home_solar_system_team_screen/home_solar_system_team_screen.dart';
import 'modules/login_screen/login_screen.dart';
import 'modules/modify_products_screen/modify_products_screen.dart';
import 'modules/order_screen/order_screen.dart';
import 'shared/const/const.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';

void main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeSolarSystemTeamCubit()..appointmentTeam(token: token),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/HomeSolarSystemTeamScreen': (context) =>
              const HomeSolarSystemTeamScreen(),
          '/OrderScreen': (context) => const OrderScreen(),
          '/ModifyProductsScreen': (context) => const ModifyProductsScreen()
        },
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.92,),
            child: child as Widget,
          );
        },
      ),
    );
  }
}
