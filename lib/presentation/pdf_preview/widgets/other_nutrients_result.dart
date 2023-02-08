import '../../../data/model/other_nutrients_model.dart';
import '../../../heiper/storing_calculation_data.dart';

List<OtherNutrientsModel> otherNutrientsdata = [];

addnutrients(List<OtherNutrients> othernutrientsdata) async {
  List othernutrients_percentage = [];
  List othernutrients_weight = [];
  for (var i = 0; i < othernutrientsdata.length; i++) {
    othernutrients_percentage.add(await getString('mixedothernutrients$i'));
    othernutrients_weight.add(await getString('mixedothernutrientsweight$i'));
  }
  for (var i = 0; i < othernutrientsdata.length; i++) {
    otherNutrientsdata.add(OtherNutrientsModel(
        name: othernutrientsdata[i].name,
        weight: othernutrients_percentage[i],
        percent: othernutrients_weight[i]));
  }
}

class OtherNutrientsModel {
  final String name;
  final String weight;
  final String percent;
  OtherNutrientsModel({
    required this.name,
    required this.weight,
    required this.percent,
  });
}
