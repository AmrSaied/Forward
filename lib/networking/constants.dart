class ApiConstants {
  static var environment = ENVIRONMENT.prod;
  static const baseUrl =
      'https://my-json-server.typicode.com/SharminSirajudeen/test_resources/';

  //endpoints
  static const users = 'users';
  static const posts = 'posts';

  static const defaultSubStatus = 0;
  static bool enableMockUp = false;
}

class CacheStorageKeys {
  static const posts = 'cached_posts';
  static const users = 'cached_users';
  static const appLocale = 'app_locale';
}

enum ENVIRONMENT {
  dev,
  qc,
  prod,
  mockUp,
}
