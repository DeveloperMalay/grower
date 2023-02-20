import 'package:flutter_test/flutter_test.dart';
import 'package:grower/data/model/category_details_model.dart';
import 'package:grower/data/model/other_nutrients_model.dart';
import 'package:grower/data/repository/category_details_repository.dart';
import 'package:grower/data/repository/login_repository.dart';
import 'package:grower/data/repository/other_nutrients_details_repository.dart';

void main() {
  group('api testing', () {
    test('login api testing', () async {
      var loginData;
      loginData = await userLogin('dbm.flutter1@gmail.com');
      expect(loginData, isNotNull);
    });
    test('nutrietns api testing', () async {
      CatelogueDetails nutrientsdata;
      nutrientsdata = await getCategoryDetails();
      expect(nutrientsdata, isNotNull);
      expect(nutrientsdata.catalogues!.length, 2);
    });
    test('testing other nutrients api', () async {
      OtherNutrientsDetails othernutrientsdata;
      othernutrientsdata = await getOtherNutrientsDetails();
      expect(othernutrientsdata, isNotNull);
    });
  });

  tearDownAll(() {
    print('we are done! Good job');
  });
}
