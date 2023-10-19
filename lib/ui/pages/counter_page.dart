
import 'package:first_web/ui/shared/custom_app_menu.dart';
import 'package:first_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CounterPage extends StatefulWidget {
  final String? base;
  const CounterPage({Key? key,  this.base}) : super(key: key);

 

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 20;

   @override
  void initState() {
    if(int.tryParse(widget.base!)!=null){
    counter=int.parse(widget.base!);
    }
    super.initState();

    
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 

          Spacer(),

          Text('Contador Stateful',style:TextStyle(fontSize:20 ,)),
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Counter:$counter',
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFlatButton(
                text: 'Increment',
                onPressed:()=> setState(() {
                  counter++;
                }),
              ),
              CustomFlatButton(
                text: 'Decrement',
                onPressed:()=> setState(() {
                  counter--;
                }),
              ),
            ],
          ),
          Spacer()
        ],
      )
    ;
  }
}
