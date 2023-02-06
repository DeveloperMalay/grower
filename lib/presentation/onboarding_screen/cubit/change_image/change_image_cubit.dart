import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_image_state.dart';

class ChangeImageCubit extends Cubit<ChangeImageState> {
  ChangeImageCubit() : super(ChangeImageState.initial());

  void changeImage() {
    Timer(Duration(seconds: 2), () {
      emit(state.copyWith(switchImage: true));
    });
  }
}
