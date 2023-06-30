import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/data/hive_storage_provider.dart';

part 'theme_storage_state.dart';

class ThemeStorageCubit extends Cubit<ThemeStorageState> {
  ThemeStorageCubit() : super(ThemeStorageInitial());

  final _storage = HiveStorageProvider();

  void fetchThemeData() async {
    emit(ThemeStorageLoading());
    try {
      final isDarkFuture = _storage.readIsDark();
      final seedColorFuture = _storage.readSeedColor();

      final isDark = await isDarkFuture;
      final seedColor = await seedColorFuture;

      emit(ThemeStorageSuccess(isDark: isDark, seedColor: seedColor));
    } catch (e) {
      emit(ThemeStorageFailure(error: e.toString()));
    }
  }

  void setThemeBrightness(bool isDark) async {
    emit(ThemeStorageLoading());
    try {
      await _storage.writeIsDark(isDark);
      fetchThemeData();
    } catch (e) {
      emit(ThemeStorageFailure(error: e.toString()));
    }
  }

  void setThemeSeedColor(int seedColor) async {
    emit(ThemeStorageLoading());
    try {
      await _storage.writeSeedColor(seedColor);
      fetchThemeData();
    } catch (e) {
      emit(ThemeStorageFailure(error: e.toString()));
    }
  }
}
