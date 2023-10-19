import 'package:first_web/provider/counter_provider.dart';
import 'package:first_web/ui/shared/custom_app_menu.dart';
import 'package:first_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class CounterProviderPage extends StatelessWidget {
  final String? q;

  const CounterProviderPage({Key? key, required this.q}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CounterProvider(q!),
      child: _CounterProviderPageBody(),
    );
  }
}

class _CounterProviderPageBody extends StatelessWidget {
  const _CounterProviderPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        const Text('Contador Provider',
            style: TextStyle(
              fontSize: 20,
            )),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Counter:${counterProvider.counter}',
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
              text: 'Increment',
              onPressed: () => counterProvider.increment(),
            ),
            CustomFlatButton(
              text: 'Decrement',
              onPressed: () => counterProvider.decrement(),
            ),
          ],
        ),
        Spacer()
      ],
    );
  }
}
