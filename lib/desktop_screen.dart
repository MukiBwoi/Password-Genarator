import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_genarator/password_operation.dart';
import 'package:password_genarator/responsive.dart';
import 'package:password_genarator/shuffle.dart';
import 'package:provider/provider.dart';
import 'dialog_box.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  bool isVisible = false;
  late List<String> password;
  final TextEditingController _newText = TextEditingController();
  final _key = GlobalKey<FormState>();
  String finalPass = "";
  void _whenPress() {
    setState(() {
      if (_key.currentState!.validate()) {
        isVisible = true;
        String name = _newText.text;
        password = name.split("");
        finalPass = shuffle(password).join();
        Clipboard.setData(
          ClipboardData(text: finalPass),
        ).then((result) {
          return showDialog(
              context: context,
              builder: (BuildContext context) => newDialog(context));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = Provider.of<Responsive>(context);
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: screenSize.getHeight(context),
            width: screenSize.getWidth(context),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff84fab0),
                Color(0xff8fd3f4),
              ],
            )),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.getWidth(context) / 11,
                vertical: screenSize.getHeight(context) * 0.1),
            height: screenSize.getHeight(context) / 1.5,
            width: screenSize.getWidth(context) <= 664.0
                ? screenSize.getWidth(context) / 1.4
                : screenSize.getWidth(context) / 1.7,
            color: const Color.fromARGB(80, 255, 255, 255),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //name
                Text(
                  "Password Genarator",
                  style: GoogleFonts.permanentMarker(
                      fontSize: screenSize.getWidth(context) * 0.03,
                      color: const Color(0xff1e88e5)),
                ),

                //icon
                const Icon(Icons.password),

                //Form
                Form(
                  key: _key,
                  child: SizedBox(
                    height: screenSize.getHeight(context) * 0.08,
                    width: screenSize.getWidth(context) * 0.6,
                    child: TextFormField(
                      validator: (val) {
                        if (PasswordOperation().isPasswordCompliant(val)) {
                          return null;
                        } else {
                          return "Please Enter Strong Password";
                        }
                      },
                      controller: _newText,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),

                SizedBox(
                  height: screenSize.getHeight(context) * 0.06,
                  width: screenSize.getWidth(context) <= 933.0
                      ? 933.0 * 0.08
                      : screenSize.getWidth(context) * 0.08,
                  child: ElevatedButton(
                    onPressed: _whenPress,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Genarate",
                        style: GoogleFonts.ubuntu(),
                      ),
                    ),
                  ),
                ),

                Visibility(
                  visible: isVisible,
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.getWidth(context) / 10),
                      child: FittedBox(
                          child: Text(
                        "Password : $finalPass",
                        style: GoogleFonts.ubuntu(color: Colors.white),
                      )),
                      height: screenSize.getHeight(context) / 16,
                      width: screenSize.getWidth(context) * 0.5,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff4facfe),
                              Color(0xff00f2fe),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
