// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'allcatalogue_cubit.dart';

enum AllcatalogueStatus {
  initial,
  loading,
  loaded,
  error,
}

class AllcatalogueState extends Equatable {
  final AllcatalogueStatus status;
  final CatelogueDetails allCatalogue;
  final CustomError error;
  AllcatalogueState({
    required this.status,
    required this.allCatalogue,
    required this.error,
  });

  factory AllcatalogueState.initial() {
    return AllcatalogueState(
        allCatalogue: CatelogueDetails(),
        status: AllcatalogueStatus.initial,
        error: CustomError());
  }

  @override
  List<Object> get props => [allCatalogue];

  AllcatalogueState copyWith({
    AllcatalogueStatus? status,
    CatelogueDetails? allCatalogue,
    CustomError? error,
  }) {
    return AllcatalogueState(
      status: status ?? this.status,
      allCatalogue: allCatalogue ?? this.allCatalogue,
      error: error ?? this.error,
    );
  }
}
