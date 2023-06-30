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
  final int? seedColor;

  const ThemeStorageSuccess({
    required this.isDark,
    required this.seedColor,
  });

  ThemeStorageSuccess copyWith({
    bool? isDark,
    int? seedColor,
  }) {
    return ThemeStorageSuccess(
      isDark: isDark ?? this.isDark,
      seedColor: seedColor ?? this.seedColor,
    );
  }

  @override
  List<Object?> get props => [isDark, seedColor];
}

class ThemeStorageFailure extends ThemeStorageState {
  final String error;

  const ThemeStorageFailure({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
