import 'package:flutter/material.dart';
import 'package:service_provider_two/res/colors/app_color.dart';



class InternetError {
  static final _instance = InternetError.internal();
  factory InternetError() => _instance;
  InternetError.internal();

  static OverlayEntry? entry;

  void show(context, page) => addOverlayEntry(context);
  void hide() => removeOverlay();

  bool get isShow => entry != null;

  addOverlayEntry(context) {
    if (entry != null) return;
    entry = OverlayEntry(builder: (BuildContext context) {
      return LayoutBuilder(builder: (_, BoxConstraints constraints) {
        return Material(
          color: AppColor.backGroundColor,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/gif/no-internet.gif',
                  height: 250,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Please check your internet connection!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(50),
                  // ),
                  height: 50,
                  width: 200,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    onPressed: () {
                      removeOverlay();
                    },
                    child: const Text(
                      "Okay",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });

    addoverlay(entry!, context);
  }

  addoverlay(OverlayEntry entry, context) async {
    Overlay.of(context)!.insert(entry);
  }

  removeOverlay() {
    entry?.remove();
    entry = null;
  }
}
