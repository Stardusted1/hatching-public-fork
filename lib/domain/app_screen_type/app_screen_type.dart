enum AppScreenType { tests, analytics, settings }

extension AppScreenExtension on AppScreenType {
  static AppScreenType fromIndex(int appScreen) {
    if (appScreen > AppScreenType.values.length) {
      return AppScreenType.values.first;
    }
    return AppScreenType.values[appScreen];
  }
}
