import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_index_state.dart';

class DropdownIndexCubit extends Cubit<DropdownIndexState> {
  DropdownIndexCubit() : super(DropdownIndexState.initial());

  void getdropdowndetails(int index, String fertilizer) {
    emit(state.copyWith(dropdownindex: index, fertilizer: fertilizer));
  }
}
