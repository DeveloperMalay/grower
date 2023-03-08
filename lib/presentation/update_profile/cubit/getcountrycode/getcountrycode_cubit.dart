import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'getcountrycode_state.dart';

class GetcountrycodeCubit extends Cubit<GetcountrycodeState> {
  GetcountrycodeCubit() : super(GetcountrycodeState.initial());

  getcode(int index) {
    emit(state.copyWith(index: index));
  }
}
