import 'package:flutter/material.dart';
import 'package:password_genarator/responsive.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<Responsive>(
              create: (_) {
                return Responsive();
              },
            ),
          ],
          child: const LayoutResponsive(),
        ));
  }
}
