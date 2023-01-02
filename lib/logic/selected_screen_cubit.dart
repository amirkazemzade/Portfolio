import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedScreenCubit extends Cubit<int> {
  SelectedScreenCubit() : super(0);

  void setScreen(int screenIndex) => emit(screenIndex);
}
