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

ScreenBreakPoints getScreenSize(double width) {
  if (width <= ScreenBreakPoints.phone.width) {
    return ScreenBreakPoints.phone;
  }
  if (width <= ScreenBreakPoints.tablet.width) {
    return ScreenBreakPoints.tablet;
  }
  if (width <= ScreenBreakPoints.laptop.width) {
    return ScreenBreakPoints.laptop;
  }
  return ScreenBreakPoints.desktop;
}
