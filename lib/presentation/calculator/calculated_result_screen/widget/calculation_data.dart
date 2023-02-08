import '../../../../heiper/storing_calculation_data.dart';

Future<Map<String, dynamic>> getData() async {
  var data = await getString('dryweight');
  final totalDryWeight = () async {
    var data = await getString('dryweight');
    return data;
  };
  final totalLiquidWeight = () async {
    var data = await getString('tlw');
    return data;
  };

  final density = () async {
    var data = await getString('density');
    return data;
  };

  final tdwofN = () async {
    var data = await getString('tdwofN');
    return data;
  };

  final tdwofP = () async {
    var data = await getString('tdwofP');
    return data;
  };

  final tdwofK = () async {
    var data = await getString('tdwofK');
    return data;
  };

  final tdwoflN = () async {
    var data = await getString('tdwoflN');
    return data;
  };

  final tdwoflP = () async {
    var data = await getString('tdwoflP');
    return data;
  };

  final tdwoflK = () async {
    var data = await getString('tdwoflK');
    return data;
  };

  final totalN = () async {
    var data = await getString('totalN');
    return data;
  };

  final totalP = () async {
    var data = await getString('totalP');
    return data;
  };

  final totalK = () async {
    var data = await getString('totalK');
    return data;
  };

  final totalWeight = () async {
    var data = await getString('totalWeight');
    return data;
  };

  final drymatterfromliquid = () async {
    var data = await getString('drymatterfromliquid');
    return data;
  };

  final totaldrymaterial = () async {
    var data = await getString('totaldrymaterial');
    return data;
  };

  final mixture = () async {
    var data = await getString('mixture');
    return data;
  };

  final totalpercentN = () async {
    var data = await getString('totalpercentN');
    return data;
  };

  final totalpercentP = () async {
    var data = await getString('totalpercentP');
    return data;
  };

  final totalpercentK = () async {
    var data = await getString('totalpercentK');
    return data;
  };

  return {
    'totalDryWeight': data,
    'totalLiquidWeight': totalLiquidWeight,
    'density': density,
    'tdwofN': tdwofN,
    'tdwofP': tdwofP,
    'tdwofK': tdwofK,
    'tdwoflN': tdwoflN,
    'tdwoflP': tdwoflP,
    'tdwoflK': tdwoflK,
    'totalN': totalN,
    'totalP': totalP,
    'totalK': totalK,
    'totalWeight': totalWeight,
    'drymatterfromliquid': drymatterfromliquid,
    'totaldrymaterial': totaldrymaterial,
    'mixture': mixture,
    'totalpercentN': totalpercentN,
    'totalpercentP': totalpercentP,
    'totalpercentK': totalpercentK,
  };
}
