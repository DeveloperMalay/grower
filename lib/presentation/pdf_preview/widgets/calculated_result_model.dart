final calculatedResult = CalculatedResultModel(
  dryfertilizer: 'Nitrogen 16-0-0',
  dryfertilizerweight: '40 Ibs',
  drynutrientsData: [
    NutrientsData(nutrients: 'N', tdw: 6.40, npk: 16),
    NutrientsData(nutrients: 'P', tdw: 0, npk: 0),
    NutrientsData(nutrients: 'K', tdw: 0, npk: 0),
    NutrientsData(nutrients: 'A', tdw: 6, npk: 15),
    NutrientsData(nutrients: 'B', tdw: 6, npk: 15),
    NutrientsData(nutrients: 'Ca', tdw: 6, npk: 15),
    NutrientsData(nutrients: 'D', tdw: 6, npk: 15),
    NutrientsData(nutrients: 'E', tdw: 6, npk: 15),
  ],
  liquidfertilizer: 'Liquid Nitrogen 8-0-0',
  liquidfertilizerweight: '834.50 lbs',
  liquidnutrientsData: [
    NutrientsData(nutrients: 'N', tdw: 66.75, npk: 8),
    NutrientsData(nutrients: 'P', tdw: 0, npk: 0),
    NutrientsData(nutrients: 'K', tdw: 0, npk: 0),
    NutrientsData(nutrients: 'A', tdw: 0, npk: 0),
    NutrientsData(nutrients: 'B', tdw: 0, npk: 0),
    NutrientsData(nutrients: 'Ca', tdw: 0, npk: 0),
    NutrientsData(nutrients: 'D', tdw: 0, npk: 0),
    NutrientsData(nutrients: 'E', tdw: 0, npk: 0),
  ],
  totalweight: '874.50 lbs',
  totaldensity: '83.45 lbs/g',
  avgnutrientsData: [
    NutrientsData(nutrients: 'N', tdw: 73.16, npk: 8.37),
    NutrientsData(nutrients: 'P', tdw: 0, npk: 0),
    NutrientsData(nutrients: 'K', tdw: 0, npk: 0),
    NutrientsData(nutrients: 'A', tdw: 6, npk: 0.69),
    NutrientsData(nutrients: 'B', tdw: 6, npk: 0.69),
    NutrientsData(nutrients: 'Ca', tdw: 6, npk: 0.69),
    NutrientsData(nutrients: 'D', tdw: 6, npk: 0.69),
    NutrientsData(nutrients: 'E', tdw: 6, npk: 0.69),
  ],
  dmpg: '83.45 lbs/g',
  dmfl: '75.11 lbs',
  dmfi: '40 lbs',
  tdm: '115.11 lbs',
  mixerweight: "106.11 lbs",
);

class CalculatedResultModel {
  final String dryfertilizer;
  final String dryfertilizerweight;

  final List<NutrientsData> drynutrientsData;
  final String liquidfertilizer;
  final String liquidfertilizerweight;

  final List<NutrientsData> liquidnutrientsData;
  final String totalweight;
  final String totaldensity;
  final List<NutrientsData> avgnutrientsData;
  final String dmpg;
  final String dmfl;
  final String dmfi;
  final String tdm;
  final String mixerweight;
  CalculatedResultModel({
    required this.dryfertilizer,
    required this.dryfertilizerweight,
    required this.drynutrientsData,
    required this.liquidfertilizer,
    required this.liquidfertilizerweight,
    required this.liquidnutrientsData,
    required this.totalweight,
    required this.totaldensity,
    required this.avgnutrientsData,
    required this.dmpg,
    required this.dmfl,
    required this.dmfi,
    required this.tdm,
    required this.mixerweight,
  });
}

class NutrientsData {
  final String nutrients;
  final double tdw;
  final double npk;
  NutrientsData({
    required this.nutrients,
    required this.tdw,
    required this.npk,
  });
}
