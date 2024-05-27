import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CatalogRoute.page, initial: true),
    AutoRoute(page: BookDetailRoute.page,  path: "/book-detail-screen/:bookId"),
    AutoRoute(page: NotFoundRoute.page, path: "*"),
    AutoRoute(page: CollectionRoute.page, path: "/collection"),
  ]; 
  
}