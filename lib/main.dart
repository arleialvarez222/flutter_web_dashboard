import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/providers/categoria_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/services/notification_service.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/api/cafe_api.dart';
import 'package:admin_dashboard/ui/layouts/doshboard/dashboard_layoud.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';

import 'package:admin_dashboard/router/router.dart';
 
void main() async {

  await LocalStorage.configurePrefs();
  CafeApi.configureDio(); //configuracion a base de datos cafeapi
  Flurorouter.configureRoutes();
  runApp( const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( lazy: false, create: (_) => AuthProvider(),),

        ChangeNotifierProvider(lazy: false, create: ( _ ) => SideMenuProvider()),

        ChangeNotifierProvider(create: ( _ ) => CategoriaProvider()),

        ChangeNotifierProvider(create: ( _ ) => UsersProvider()),

        ChangeNotifierProvider(create: ( _ ) => UserFormProvider()),
        
      ],
      child: const MyApp(),
    );
  }
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.messengerKey,
      builder: (_, child){
        
        final authProvider = Provider.of<AuthProvider>(context);

        if(authProvider.authStatus == AuthStatus.checking){
          //return Center(child: Text('Checking'),);
          return const SplashLayoud();
        }

        if(authProvider.authStatus == AuthStatus.authenticated){
          return DashboardLayoud(child: child!);
        }else{
          return AuthLayout(child: child!);
        }

        //print('Token: ');
        //print(LocalStorage.prefs.getString('token'));

        //return AuthLayout(child: child!,);
        //return DashboardLayoud(child: child!,);
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey.withOpacity(0.5)
          )
        )
      ),
    );
  }
}