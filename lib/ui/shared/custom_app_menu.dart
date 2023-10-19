
import 'package:first_web/services/navigator_service.dart';
import 'package:first_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../locator.dart';

class CustomAppMenu extends StatefulWidget {
  
 final BuildContext context;
   CustomAppMenu({ 
     required this.context,
    Key? key 
    }) : super(key: key);


  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> {
  @override
  Widget build(_) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return (constraints.maxWidth>520)
        ?_TabletDesktopMenu(context: this.context)
        :_MobilepMenu(context:this.context);
      },
    );
  }
}

class _TabletDesktopMenu extends StatelessWidget {
  final BuildContext context;
  const _TabletDesktopMenu({
    Key? key, required this.context,
  }) : super(key: key);

  @override
  Widget build(_) {
    return Container( 
      padding: EdgeInsets.symmetric( horizontal: 20,vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
           CustomFlatButton(
                text: 'Contador Stateful',
                onPressed:()=>context.go('/stateful'),
                color: Colors.black,
              ),
              SizedBox(width: 10,),
           CustomFlatButton(
                text: 'Contador Provider',
               onPressed:()=>context.go('/provider'),
                color: Colors.black,
              ),
              SizedBox(width: 10,),
           CustomFlatButton(
                text: 'Otra Screen',
                onPressed:()=>context.go('/abc123'),
                color: Colors.black,
              ),
              SizedBox(width: 10,),
           CustomFlatButton(
                text: 'Stateful 100',
                onPressed:()=>context.go('/stateful/100'),
                color: Colors.black,
              ),
           CustomFlatButton(
                text: 'Provider 200',
                onPressed:()=>context.go('/provider?q=200'),
                color: Colors.black,
              ),
        ],
      ),
    );
  }
}
class _MobilepMenu extends StatelessWidget {
  final BuildContext context;
  const _MobilepMenu({
    Key? key,required this.context,
  }) : super(key: key);

  @override
  Widget build(_) {
    return Container( 
      padding: EdgeInsets.symmetric( horizontal: 20,vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
           CustomFlatButton(
                text: 'Contador Stateful',
                onPressed:()=>context.go('/stateful'),
                color: Colors.black,
              ),
              SizedBox(width: 10,),
           CustomFlatButton(
                text: 'Contador Provider',
               onPressed:()=>context.go('/provider'),
                color: Colors.black,
              ),
              SizedBox(width: 10,),
           CustomFlatButton(
                text: 'Otra Screen',
                onPressed:()=>context.go('/abc123'),
                color: Colors.black,
              ),
        ],
      ),
    );
  }
}