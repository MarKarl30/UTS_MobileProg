import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:midterm_project/widgets/qr_overlay.dart';
import 'package:midterm_project/screens/pay_screen.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final MobileScannerController controller = MobileScannerController(
      torchEnabled: false,
      autoStart: true,
      useNewCameraSelector: true,
      detectionSpeed: DetectionSpeed.noDuplicates);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          controller: controller,
          onDetect: (BarcodeCapture capture) async {
            final List<Barcode> barcodes = capture.barcodes;
            final barcode = barcodes.first;

            if (barcode.rawValue != null) {
              await controller
                  .stop()
                  .then((value) => controller.dispose())
                  // ignore: use_build_context_synchronously
                  .then((value) => Navigator.pushReplacement(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PayScreen()),
                      ));
            } else {
              controller.dispose();
            }
          },
        ),
        QrOverlay(
          controller: controller,
        )
      ],
    );
  }
}
