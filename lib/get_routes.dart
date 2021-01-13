import 'package:get/get.dart';
import 'package:iTalk/views/history_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/history_page',
      page: () => HistoryPage(),
    ),
  ];
}
