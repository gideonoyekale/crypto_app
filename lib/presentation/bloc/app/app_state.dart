part of 'app_cubit.dart';

class AppState extends Equatable {
  final int pageIndex;
  const AppState({
    this.pageIndex = 0,
  });

  AppState copyWith({
    int? pageIndex,
  }) {
    return AppState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object?> get props => [
        pageIndex,
      ];
}
