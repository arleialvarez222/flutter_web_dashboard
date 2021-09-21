import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';

class AuthLayout extends StatelessWidget {

  final Widget child;

  const AuthLayout({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
      
            ( size.width > 1000 )
              ? _DestopBody(child: child)
              :  _MobileBody(child: child),
           
            const LinksBar(),
      
      
            
      
          ],
        ),
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {

  final Widget child;

  const _MobileBody({ 
    Key? key, 
    required this.child 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const SizedBox(height: 20,),

          const CustomTitle(),

          SizedBox(
            width: double.infinity,
            height: 470,
            child: child,
          ),

          const SizedBox(
            width: double.infinity,
            height: 420,
            child: BackgroundTwitter(),
          ),

        ],
      ),
      
    );
  }
}


class _DestopBody extends StatelessWidget {

  final Widget child;

  const _DestopBody({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(

      width: size.width,
      height: size.height * 0.96,
      color: Colors.black,
      child: Row(
        children: [

          const Expanded(child: BackgroundTwitter()),

          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [

                const SizedBox(height: 20,),

                const CustomTitle(),

                //SizedBox(height: 30,),

                Expanded(
                  child: child,
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}