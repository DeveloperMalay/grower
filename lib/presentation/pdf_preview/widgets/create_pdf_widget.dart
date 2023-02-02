import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../../../heiper/storing_calculation_data.dart';
import 'calculated_result_model.dart';

Future<Uint8List> makePdf(CalculatedResultModel invoice) async {
  final pdf = Document();
  var totalWeight = await getString('totalWeight');
  var density = await getString('density');
  var totalN = await getString('totalN');
  var totalP = await getString('totalP');
  var totalK = await getString('totalK');
  pdf.addPage(Page(build: (context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Result: ',
            style: TextStyle(
              fontSize: 20,
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text("Total Weight: ${totalWeight}"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text("Total Density: ${density}"),
        ),
        SizedBox(height: 15),
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
            TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  "N",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  totalN,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  '88',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  "P",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  totalP,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  '12',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  "K",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  totalK,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  '6',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ]),
          ],
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text('Dry Matter/gallon water: ${invoice.dmpg}'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text('Dry Matter from liquid: ${invoice.dmfl}'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text('Dry material from ingredients: ${invoice.dmfi}'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text('Total Dry material: ${invoice.tdm}'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text("Mixture is: ${invoice.mixerweight}"),
        ),
        // Text('Dry fertilizer: ', style: TextStyle(fontSize: 20)),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 5),
        //   child: Text("Dry fertilizer: ${invoice.dryfertilizer}"),
        // ),

        // SizedBox(height: 5),
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
        //     ...calculatedResult.drynutrientsData
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
        // SizedBox(height: 30),
        // Text('Liquid fertilizer: ', style: TextStyle(fontSize: 20)),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 5),
        //   child: Text("Liquid fertilizer: ${invoice.liquidfertilizer}"),
        // ),
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 5),
        //   child: Text(
        //       'Total weight of liquid fertilizer: ${invoice.liquidfertilizerweight}'),
        // ),
        // SizedBox(height: 5),
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
