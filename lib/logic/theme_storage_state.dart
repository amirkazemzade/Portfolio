part of 'theme_storage_cubit.dart';

abstract class ThemeStorageState extends Equatable {
  const ThemeStorageState();
}

class ThemeStorageInitial extends ThemeStorageState {
  @override
  List<Object> get props => [];
}

class ThemeStorageLoading extends ThemeStorageState {
  @override
  List<Object> get props => [];
}

class ThemeStorageSuccess extends ThemeStorageState {
  final bool? isDark;

  const ThemeStorageSuccess({
    required this.isDark,
  });

  @override
  List<Object?> get props => [isDark];
}

class ThemeStorageFailure extends ThemeStorageState {
  final String error;

  const ThemeStorageFailure({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
