import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/data/hive_storage_provider.dart';

part 'theme_storage_state.dart';

class ThemeStorageCubit extends Cubit<ThemeStorageState> {
  ThemeStorageCubit() : super(ThemeStorageInitial());

  final _storage = HiveStorageProvider();

  void fetchThemeBrightness() async {
    emit(ThemeStorageLoading());
    try {
      final response = await _storage.readIsDark();
      emit(ThemeStorageSuccess(isDark: response));
    } catch (e) {
      emit(ThemeStorageFailure(error: e.toString()));
    }
  }

  void setThemeBrightness(bool isDark) async {
    emit(ThemeStorageLoading());
    try {
      await _storage.writeIsDark(isDark);
      final response = await _storage.readIsDark();
      emit(ThemeStorageSuccess(isDark: response));
    } catch (e) {
      emit(ThemeStorageFailure(error: e.toString()));
    }
  }
}
