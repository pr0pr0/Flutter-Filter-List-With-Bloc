import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRDialog extends StatelessWidget {
  const QRDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const defaultHorizontalPadding = 40.0;
    const defaultVerticalPadding = 24.0;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
            vertical: defaultVerticalPadding * 10,
            horizontal: width > (width + defaultHorizontalPadding * 2)
                ? (width - width) / 2
                : defaultHorizontalPadding),
        backgroundColor: Colors.white,
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade500),
                borderRadius: BorderRadius.circular(12)),
            child: QrImage(
             /* embeddedImage: AssetImage('assets/images/paris.jpg'),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size(50, 50),
              ),
              */
              data: "SAH10",
              size: 250.0,
            ),
          ),
        ),
      ),
    );
  }
}
