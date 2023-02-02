import 'package:grower/heiper/storing_calculation_data.dart';

calculate(String tdw, String liquidfertilizer, String density) {
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
  num totalweight = num.parse(tdw) + tlw;
  saveString('totalWeight', totalweight.toString());

  num totalN = tdwofN + tdwoflN;
  saveString('totalN', totalN.toString());
  num totalP = tdwofP + tdwoflP;
  saveString('totalP', totalP.toString());
  num totalK = tdwofK + tdwoflK;
  saveString('totalK', totalK.toString());
  num totalA = totalweight * 1.15;
  saveString('totalA', totalA.toString());
  num totalB = totalweight * 0;
  saveString('totalB', totalB.toString());
  num totalC = totalweight * 0.38;
  saveString('totalC', totalC.toString());
  num totalD = totalweight * 0;
  saveString('totalD', totalD.toString());
  num totalE = totalweight * 0;
  saveString('totalE', totalE.toString());

  num totalpercentN = totalweight / totalN * 100;
  saveString('totalpercentN', totalpercentN.toString());
  num totalpercentP = totalweight / totalP * 100;
  saveString('totalpercentP', totalpercentP.toString());
  num totalpercentK = totalweight / totalK * 100;
  saveString('totalpercentK', totalpercentK.toString());
  num drymatterfromliquid = num.parse(density) - 8.34;
  saveString('drymatterfromliquid', drymatterfromliquid.toString());

  num totaldrymaterial = drymatterfromliquid + num.parse(tdw);
  saveString('totaldrymaterial', totaldrymaterial.toString());

  num mixture = totaldrymaterial - 9;
  saveString('mixture', mixture.toString());
}
