import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:flutter/material.dart';

import '../../shared/sidebar.dart';

class DashboardLayoud extends StatefulWidget {

  final Widget child;

  const DashboardLayoud({ 
    Key? key, 
    required this.child 
  }) : super(key: key);

  @override
  State<DashboardLayoud> createState() => _DashboardLayoudState();
}

class _DashboardLayoudState extends State<DashboardLayoud> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();

    SideMenuProvider.menuController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
  }
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Stack(
        children: [

          Row(
            children: [
              
              if(size.width >= 700)
                const Sidebar(),

              Expanded(
                child: Column(
                  children: [

                    const Navbar(),

                    Expanded( 
                      child: Container(
                        child: widget.child ,
                      )
                    ),

                  ],
                )
              ),         
            ],
          ),

          if(size.width < 700)
            AnimatedBuilder(
              animation: SideMenuProvider.menuController, 
              builder: (context, _) => Stack(
                children: [

                  if(SideMenuProvider.isOpen)
                    AnimatedOpacity(
                      opacity: SideMenuProvider.opacity.value, 
                      duration: const Duration(milliseconds: 200),
                      child: GestureDetector(
                        onTap: () => SideMenuProvider.closeMenu(),
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black26,
                        ),
                      ),
                    ),

                  Transform.translate(
                    offset: Offset(SideMenuProvider.movent.value, 0),
                    child: const Sidebar(),
                  ),
                ],
              ),
            ),
        ],
      )
    );
  }
}