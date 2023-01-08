// import 'dart:html';

bool readDarkMode() {
  // final cookie = document.cookie!;
  // final entity = cookie.split("; ").map((item) {
  //   final split = item.split("=");
  //   return MapEntry(split[0], split[1]);
  // });
  // final cookieMap = Map.fromEntries(entity);
  // return cookieMap["is_dark"] == "true";
  return true;
}

void writeDarkMode(bool isDark) {
  // document.cookie = "is_dark=$isDark";
}
