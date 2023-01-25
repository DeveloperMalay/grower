import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../../theme/custom_theme.dart';
import 'widgets/calculated_result_model.dart';
import 'widgets/create_pdf_widget.dart';

class PdfPreviewScreen extends StatelessWidget {
  const PdfPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: CustomTheme.primaryColor,
            )),
        title: Container(
          height: 34,
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: CustomTheme.greylight,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/grower_logo.png',
                height: 30,
              ),
              Text(
                'Pdf Preview',
                style: TextStyle(color: CustomTheme.primaryColor, fontSize: 14),
              )
            ],
          ),
        ),
      ),
      body: PdfPreview(
        build: (context) => makePdf(calculatedResult),
      ),
    );
  }
}
