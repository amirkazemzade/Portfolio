import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/selected_screen_cubit.dart';
import 'package:portfolio/logic/theme_storage_cubit.dart';
import 'package:portfolio/styles/colors.dart';
import 'package:portfolio/styles/theme.dart';
import 'package:portfolio/widgets/dashboard/dashboard.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectedScreenCubit>(
          create: (context) => SelectedScreenCubit(),
        ),
        BlocProvider<ThemeStorageCubit>(
          create: (context) => ThemeStorageCubit()..fetchThemeData(),
        ),
      ],
      child: BlocBuilder<SelectedScreenCubit, int>(
        builder: (context, screenIndex) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp(
                title: 'Amir\'s Portfolio',
                home: BlocBuilder<ThemeStorageCubit, ThemeStorageState>(
                  builder: (context, state) {
                    bool isDark = false;
                    Color seedColor = roseColor;

                    if (state is ThemeStorageSuccess && state.isDark != null) {
                      isDark = state.isDark!;
                    }
                    if (state is ThemeStorageSuccess && state.seedColor != null) {
                      seedColor = Color(state.seedColor!);
                    }
                    return DynamicTheme(
                      isDark: isDark,
                      colorSeed: seedColor,
                      child: const Dashboard(),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
