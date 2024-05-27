// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:acquire_lms_mobile_app/screens/book_collection_screen.dart'
    as _i3;
import 'package:acquire_lms_mobile_app/screens/book_detail_screen.dart' as _i1;
import 'package:acquire_lms_mobile_app/screens/catalog_screen.dart' as _i2;
import 'package:acquire_lms_mobile_app/screens/not_found_screen.dart' as _i4;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    BookDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BookDetailRouteArgs>(
          orElse: () =>
              BookDetailRouteArgs(bookId: pathParams.optString('bookId')));
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BookDetailScreen(
          key: args.key,
          bookId: args.bookId,
        ),
      );
    },
    CatalogRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CatalogScreen(),
      );
    },
    CollectionRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CollectionScreen(),
      );
    },
    NotFoundRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.NotFoundScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookDetailScreen]
class BookDetailRoute extends _i5.PageRouteInfo<BookDetailRouteArgs> {
  BookDetailRoute({
    _i6.Key? key,
    String? bookId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          BookDetailRoute.name,
          args: BookDetailRouteArgs(
            key: key,
            bookId: bookId,
          ),
          rawPathParams: {'bookId': bookId},
          initialChildren: children,
        );

  static const String name = 'BookDetailRoute';

  static const _i5.PageInfo<BookDetailRouteArgs> page =
      _i5.PageInfo<BookDetailRouteArgs>(name);
}

class BookDetailRouteArgs {
  const BookDetailRouteArgs({
    this.key,
    this.bookId,
  });

  final _i6.Key? key;

  final String? bookId;

  @override
  String toString() {
    return 'BookDetailRouteArgs{key: $key, bookId: $bookId}';
  }
}

/// generated route for
/// [_i2.CatalogScreen]
class CatalogRoute extends _i5.PageRouteInfo<void> {
  const CatalogRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CatalogRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatalogRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CollectionScreen]
class CollectionRoute extends _i5.PageRouteInfo<void> {
  const CollectionRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CollectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'CollectionRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NotFoundScreen]
class NotFoundRoute extends _i5.PageRouteInfo<void> {
  const NotFoundRoute({List<_i5.PageRouteInfo>? children})
      : super(
          NotFoundRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotFoundRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
