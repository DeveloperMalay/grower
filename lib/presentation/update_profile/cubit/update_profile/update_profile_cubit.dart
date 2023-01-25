import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grower/data/model/custom_error.dart';
import 'package:grower/data/model/user_details_model.dart';
import 'package:grower/data/repository/update_user_details_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'update_profile_state.dart';

class UserProfileCubit extends Cubit<UpdateProfileState> {
  UserProfileCubit() : super(UpdateProfileState.initial());

  Future userDetailsUpdate(String name, String address, String number) async {
    emit(state.copyWith(status: UserProfileStatus.loading));

    final prefs = await SharedPreferences.getInstance();
    String email = await prefs.getString('email')!;
    try {
      var updatedProfile =
          await updateUserDetails(name, address, number, email);
      print(updatedProfile);
      emit(state.copyWith(
          status: UserProfileStatus.loaded, userDetails: updatedProfile));
    } on CustomError catch (e) {
      emit(state.copyWith(status: UserProfileStatus.error, error: e));
    }
  }
}
