import 'package:grower/heiper/storing_calculation_data.dart';

calculate(String tdw, String liquidfertilizer, String density) async {
  // calculation for dry fertilizer
  num tdwofN = num.parse(tdw) * 0.8; //weight of N is % of total dry weight
  saveString('tdwofN', tdwofN.toStringAsFixed(2));
  num tdwofP = num.parse(tdw) * 0; //weight of P is % of total dry weight
  saveString('tdwofP', tdwofP.toStringAsFixed(2));
  num tdwofK = num.parse(tdw) * 0; //weight of K is % of total dry weight
  saveString('tdwofK', tdwofK.toStringAsFixed(2));

  //getting dry other nutrients value form sharedpreferences
  List othernutrients = [];
  List othernutrientsweight = [];
  for (var i = 0; i < 2; i++) {
    othernutrients.add(await getString(
        'dryothernutrients$i')); //getting the user given persentages
    othernutrientsweight.add(num.parse(tdw) *
        num.parse(othernutrients[i]) /
        100); //calculating the other nutrients weight from user given persentage
    saveString('dryothernutrientsweight$i',
        othernutrientsweight[i].toStringAsFixed(2));
  }

  num tdwofCa = num.parse(tdw) *
      num.parse(othernutrients[0]) /
      100; //total dry weight of calcium
  saveString('tdwofCa', tdwofCa.toStringAsFixed(2));
  num tdwofS = num.parse(tdw) *
      num.parse(othernutrients[1]) /
      100; //total dry weight of sodium
  saveString('tdwofS', tdwofS.toStringAsFixed(2));

//
//
//
//
//
//
  //calculation for liquid fertilizer
  num tlw = num.parse(liquidfertilizer) *
      num.parse(density); //total weight of liquid fertilizer
  saveString('tlw', tlw.toStringAsFixed(2));
  num tdwoflN = tlw * 0.08; //weight of N is % of total liquid weight
  saveString('tdwoflN', tdwoflN.toStringAsFixed(2));
  num tdwoflP = tlw * 0.02; //weight of P is % of total liquid weight
  saveString('tdwoflP', tdwoflP.toStringAsFixed(2));
  num tdwoflK = tlw * 0.01; //weight of K is % of total liquid weight
  saveString('tdwoflK', tdwoflK.toStringAsFixed(2));

  //getting liquid other nutrients value form sharedpreferences
  List liquidothernutrients = [];
  List liquidothernutrientsweight = [];
  for (var i = 0; i < 2; i++) {
    liquidothernutrients.add(await getString(
        'liquidothernutrients$i')); //getting the user given persentages
    liquidothernutrientsweight.add(tlw *
        num.parse(liquidothernutrients[i]) /
        100); //calculating the other nutrients weight from user given persentage
    saveString('liquidothernutrientsweight$i',
        liquidothernutrientsweight[i].toStringAsFixed(2));
  }

//
//
//
//
//calculation for the total mixture
  num totalweight =
      num.parse(tdw) + tlw; //total weight of dry and liquid fertilizer
  saveString('totalWeight', totalweight.toStringAsFixed(2));

  num totalN = tdwofN + tdwoflN; //total weight of N
  saveString('totalN', totalN.toStringAsFixed(2));
  num totalP = tdwofP + tdwoflP; //total weight of P
  saveString('totalP', totalP.toStringAsFixed(2));
  num totalK = tdwofK + tdwoflK; //total weight of K
  saveString('totalK', totalK.toStringAsFixed(2));

  num totalpercentN =
      totalN / totalweight * 100; //total percent of N in the mixture
  saveString('totalpercentN', totalpercentN.toStringAsFixed(2));
  num totalpercentP =
      totalP / totalweight * 100; //total percent of Pin the mixture
  saveString('totalpercentP', totalpercentP.toStringAsFixed(2));
  num totalpercentK =
      totalK / totalweight * 100; //total percent of K in the mixture
  saveString('totalpercentK', totalpercentK.toStringAsFixed(2));
  num drymatterfromliquid = num.parse(density) - 8.34;
  saveString('drymatterfromliquid', drymatterfromliquid.toStringAsFixed(2));

  num totaldrymaterial = drymatterfromliquid + num.parse(tdw);
  saveString('totaldrymaterial', totaldrymaterial.toStringAsFixed(2));

  num mixture = totaldrymaterial - 9;
  saveString('mixture', mixture.toStringAsFixed(2));

  //getting dry other nutrients value form sharedpreferences
  List mixedothernutrients = [];
  List mixedothernutrientsweight = [];
  for (var i = 0; i < 2; i++) {
    mixedothernutrientsweight
        .add(othernutrientsweight[i] + liquidothernutrientsweight[i]);
    saveString('mixedothernutrientsweight$i',
        mixedothernutrientsweight[i].toStringAsFixed(2));

    mixedothernutrients.add(mixedothernutrientsweight[i] / totalweight * 100);
    saveString(
        'mixedothernutrients$i', mixedothernutrients[i].toStringAsFixed(2));
  }
}
