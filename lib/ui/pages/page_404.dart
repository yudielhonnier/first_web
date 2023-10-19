import 'package:first_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page404 extends StatelessWidget {
  final Exception? error;

  const Page404({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('404'),
            Text('Page not found'),
            CustomFlatButton(
              text: 'Regresar',
              onPressed: () => context.go('/provider'),
            )
          ],
        ),
      ),
    );
  }
}
