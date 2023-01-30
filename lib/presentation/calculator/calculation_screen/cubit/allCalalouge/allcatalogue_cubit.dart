import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../data/model/category_details_model.dart';
import '../../../../../data/model/custom_error.dart';
import '../../../../../data/repository/category_details_repository.dart';
part 'allcatalogue_state.dart';

class AllcatalogueCubit extends Cubit<AllcatalogueState> {
  AllcatalogueCubit() : super(AllcatalogueState.initial());

  Future getCatalogue() async {
    emit(state.copyWith(status: AllcatalogueStatus.loading));
    try {
      var catalogue = await getCategoryDetails();
      // var data = catalogue.catalogues!
      //     .where((e) => e.type == 'dry fertilizer')
      //     .toList();
      // var catalogue = await getCategoryDetails().then((value) => value
      //     .catalogues!
      //     .where((e) => e.type == 'liquid fertilizer')
      //     .toList());
      // print(
      //   data.length,
      // );
      emit(state.copyWith(
          allCatalogue: catalogue, status: AllcatalogueStatus.loaded));
    } on CustomError catch (e) {
      emit(state.copyWith(status: AllcatalogueStatus.error, error: e));
    }
  }
}
