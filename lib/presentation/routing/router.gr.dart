// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FullNewsRoute.name: (routeData) {
      final args = routeData.argsAs<FullNewsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FullNewsScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    NewsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsListScreen(),
      );
    },
  };
}

/// generated route for
/// [FullNewsScreen]
class FullNewsRoute extends PageRouteInfo<FullNewsRouteArgs> {
  FullNewsRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          FullNewsRoute.name,
          args: FullNewsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'FullNewsRoute';

  static const PageInfo<FullNewsRouteArgs> page =
      PageInfo<FullNewsRouteArgs>(name);
}

class FullNewsRouteArgs {
  const FullNewsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'FullNewsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [NewsListScreen]
class NewsListRoute extends PageRouteInfo<void> {
  const NewsListRoute({List<PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
