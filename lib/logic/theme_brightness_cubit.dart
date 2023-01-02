import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBrightnessCubit extends Cubit<bool> {
  ThemeBrightnessCubit() : super(false);

  void setBrightness(bool isDark) => emit(isDark);

  void revertBrightness() => emit(!state);
}
