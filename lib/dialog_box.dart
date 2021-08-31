import 'package:flutter/material.dart';

Dialog newDialog(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    child: Container(
        color: Colors.white,
        height: 100,
        width: 200,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text("Password Copied"),
            const Spacer(),
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close")),
            const Spacer(),
          ],
        ))),
  );
}
