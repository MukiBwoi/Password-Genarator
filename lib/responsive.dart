import 'package:flutter/cupertino.dart';
import 'package:password_genarator/desktop_screen.dart';
import 'package:password_genarator/mobile_screen.dart';

class Responsive with ChangeNotifier {
  MediaQueryData setScreenSize(BuildContext context) {
    return MediaQuery.of(context);
  }

  double getHeight(BuildContext context) {
    return setScreenSize(context).size.height;
  }

  double getWidth(BuildContext context) {
    return setScreenSize(context).size.width;
  }
}

class LayoutResponsive extends StatelessWidget {
  const LayoutResponsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return const MobileScreen();
        } else {
          return const DesktopScreen();
        }
      },
    );
  }
}
