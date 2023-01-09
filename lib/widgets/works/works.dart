import 'package:flutter/material.dart';
import 'package:portfolio/util/screen_break_points.dart';
import 'package:portfolio/widgets/works/works_down_tablet.dart';
import 'package:portfolio/widgets/works/works_up_tablet.dart';

class Works extends StatelessWidget {
  const Works({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= ScreenBreakPoints.tablet.width) {
              return const WorksUpTablet();
            }
            return const WorksDownTablet();
          },
        ),
      ],
    );
  }
}
