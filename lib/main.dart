import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/logic/selected_screen_cubit.dart';
import 'package:portfolio/logic/theme_brightness_cubit.dart';
import 'package:portfolio/styles/theme.dart';
import 'package:portfolio/util.dart';
import 'package:portfolio/widgets/dashboard.dart';
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
        BlocProvider<ThemeBrightnessCubit>(
          create: (context) => ThemeBrightnessCubit(readDarkMode()),
        ),
      ],
      child: BlocBuilder<ThemeBrightnessCubit, bool>(
        builder: (context, isDark) {
          return BlocBuilder<SelectedScreenCubit, int>(
            builder: (context, screenIndex) {
              return Sizer(
                builder: (context, orientation, deviceType) {
                  return MaterialApp(
                    title: 'Amir\'s Portfolio',
                    home: DynamicTheme(
                      isDark: isDark,
                      themeIndex: screenIndex,
                      child: const Dashboard(),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
