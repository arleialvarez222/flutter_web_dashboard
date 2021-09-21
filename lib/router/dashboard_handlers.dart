
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/category_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/user_view.dart';
import 'package:admin_dashboard/ui/views/userid_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {

  static Handler dashboard = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

      if(authProvider.authStatus == AuthStatus.authenticated){
        return const DashboardView();
      }else{
        return const LoginView();
      }
    }  
  );

  static Handler icons = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);

      if(authProvider.authStatus == AuthStatus.authenticated){
        return const IconsView();
      }else{
        return const LoginView();
      }
    }  
  );

  static Handler blank = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);

      if(authProvider.authStatus == AuthStatus.authenticated){
        return const BlankView();
      }else{
        return const LoginView();
      }
    }  
  );

  static Handler categoria = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.categoriaRoute);

      if(authProvider.authStatus == AuthStatus.authenticated){
        return const CategoryView();
      }else{
        return const LoginView();
      }
    }  
  );

  static Handler users = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.userRoute);

      if(authProvider.authStatus == AuthStatus.authenticated){
        return const UsersView();
      }else{
        return const LoginView();
      }
    }  
  );

  static Handler userid = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.useridRoute);

      if(authProvider.authStatus == AuthStatus.authenticated){

        if(params['uid']?.first != null){
          return UseridView(uid: params['uid']!.first);
        }else{
          return const UsersView();
        }

      }else{
        return const LoginView();
      }
    }  
  );

}