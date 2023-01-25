import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'calculated_result_model.dart';

Future<Uint8List> makePdf(CalculatedResultModel invoice) async {
  final pdf = Document();
  pdf.addPage(Page(build: (context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dry fertilizer: ', style: TextStyle(fontSize: 20)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text("Dry fertilizer: ${invoice.dryfertilizer}"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
              'Total weight of dry fertilizer: ${invoice.dryfertilizerweight}'),
        ),
        SizedBox(height: 5),
        Table(
          border: TableBorder.all(color: PdfColors.black),
          children: [
            TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  "Nutrients",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  "TDW(lbs)",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  "NPK(%)",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ]),
            ...calculatedResult.drynutrientsData
                .map(
                  (e) => TableRow(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Text(
                        e.nutrients,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Text(
                        e.tdw.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Text(
                        e.npk.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ]),
                )
                .toList(),
          ],
        ),
        SizedBox(height: 30),
        Text('Liquid fertilizer: ', style: TextStyle(fontSize: 20)),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text("Liquid fertilizer: ${invoice.liquidfertilizer}"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
              'Total weight of liquid fertilizer: ${invoice.liquidfertilizerweight}'),
        ),
        SizedBox(height: 5),
        // Table(
        //   border: TableBorder.all(color: PdfColors.black),
        //   children: [
        //     TableRow(children: [
        //       Padding(
        //         padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        //         child: Text(
        //           "Nutrients",
        //           style: TextStyle(fontSize: 14),
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        //         child: Text(
        //           "TDW(lbs)",
        //           style: TextStyle(fontSize: 14),
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        //         child: Text(
        //           "NPK(%)",
        //           style: TextStyle(fontSize: 14),
        //         ),
        //       ),
        //     ]),
        //     ...calculatedResult.liquidnutrientsData
        //         .map(
        //           (e) => TableRow(children: [
        //             Padding(
        //               padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        //               child: Text(
        //                 e.nutrients,
        //                 style: TextStyle(fontSize: 14),
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        //               child: Text(
        //                 e.tdw.toString(),
        //                 style: TextStyle(fontSize: 14),
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        //               child: Text(
        //                 e.npk.toString(),
        //                 style: TextStyle(fontSize: 14),
        //               ),
        //             ),
        //           ]),
        //         )
        //         .toList(),
        //   ],
        // ),
      
      ],
    );
  }));
  return pdf.save();
}
