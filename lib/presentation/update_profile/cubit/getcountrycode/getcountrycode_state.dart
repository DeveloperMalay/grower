part of 'getcountrycode_cubit.dart';

class GetcountrycodeState extends Equatable {
  final int index;
  GetcountrycodeState({
    required this.index,
  });

  factory GetcountrycodeState.initial() {
    return GetcountrycodeState(index: 0);
  }
  @override
  List<Object> get props => [index];

  GetcountrycodeState copyWith({
    int? index,
  }) {
    return GetcountrycodeState(
      index: index ?? this.index,
    );
  }
}
