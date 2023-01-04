enum ScreenBreakPoints { phone, tablet, laptop, desktop }

extension ScreenBreakPointsExtension on ScreenBreakPoints {
  int get width {
    final widthValues = {
      ScreenBreakPoints.phone: 425,
      ScreenBreakPoints.tablet: 768,
      ScreenBreakPoints.laptop: 1024,
      ScreenBreakPoints.desktop: 1440,
    };

    return widthValues[this]!;
  }
}
