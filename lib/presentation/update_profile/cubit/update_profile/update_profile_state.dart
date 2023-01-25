part of 'update_profile_cubit.dart';

enum UserProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class UpdateProfileState extends Equatable {
  final UserProfileStatus status;
  final UserDetails userDetails;
  final CustomError error;
  UpdateProfileState({
    required this.status,
    required this.userDetails,
    required this.error,
  });

  factory UpdateProfileState.initial() {
    return UpdateProfileState(
        status: UserProfileStatus.initial,
        userDetails: UserDetails(
            data: Data(
                name: 'Name',
                email: "Email",
                number: "Number",
                address: "Address")),
        error: CustomError());
  }
  UpdateProfileState copyWith({
    UserProfileStatus? status,
    UserDetails? userDetails,
    CustomError? error,
  }) {
    return UpdateProfileState(
      status: status ?? this.status,
      userDetails: userDetails ?? this.userDetails,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, userDetails, error];
}
