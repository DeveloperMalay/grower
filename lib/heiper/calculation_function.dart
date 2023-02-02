import 'package:grower/heiper/storing_calculation_data.dart';

calculateTDW(String tdw, String liquidfertilizer, String density) {
  // calculation for dry fertilizer
  num tdwofN = num.parse(tdw) * 0.8; //weight of N is 80% of total dry weight
  saveString('tdwofN', tdwofN.toString());
  num tdwofP = num.parse(tdw) * 0; //weight of P is 0% of total dry weight
  saveString('tdwofP', tdwofP.toString());
  num tdwofK = num.parse(tdw) * 0; //weight of K is 0% of total dry weight
  saveString('tdwofK', tdwofK.toString());

  //calculation for liquid fertilizer
  num tlw = num.parse(liquidfertilizer) *
      num.parse(density); //total weight of liquid fertilizer
  saveString('tlw', tlw.toString());
  num tdwoflN = tlw * 0.08; //weight of N is 8% of total liquid weight
  saveString('tdwoflN', tdwoflN.toString());
  num tdwoflP = tlw * 0.02; //weight of P is 2% of total liquid weight
  saveString('tdwoflP', tdwoflP.toString());
  num tdwoflK = tlw * 0.01; //weight of K is 1% of total liquid weight
  saveString('tdwoflK', tdwoflK.toString());

  //calculation for the total mixture
  num total = num.parse(tdw) + tlw;
  saveString('totalWeight', total.toString());

  num totalN = total * 0.88; //weight of N is 8% of total liquid weight
  saveString('totalN', totalN.toString());
  num totalP = total * 0.12; //weight of P is 2% of total liquid weight
  saveString('totalP', totalP.toString());
  num totalK = total * 0.06; //weight of K is 1% of total liquid weight
  saveString('totalK', totalK.toString());
}
