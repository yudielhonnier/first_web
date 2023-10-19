import 'package:first_web/ui/shared/custom_app_menu.dart';
import 'package:first_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MainLayoutPage extends StatelessWidget {
  final Widget child;
  final BuildContext context;

  const MainLayoutPage({
    Key? key,
    required this.child,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(_) {
    print('object');
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // CustomAppMenu(context: this.context,),
            Container( 
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
        ],
      ),
    ),
            Spacer(),
            Expanded(child: child),
            Spacer()
          ],
        ),
      ),
    );
  }
}
