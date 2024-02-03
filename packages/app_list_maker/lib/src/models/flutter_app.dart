import 'package:app_list_maker/src/models/app.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flutter_app.g.dart';

@JsonSerializable()
class FlutterApp extends App {
  FlutterApp({
    required this.slug,
    required this.name,
    this.description,
    this.website,
    this.repository,
    this.icon,
    this.platforms,
    this.category,
  });

  factory FlutterApp.fromJson(Map<String, dynamic> json) {
    String slug = json['slug'];
    return _$FlutterAppFromJson({
      ...json,
      'icon': json['icon'] ??
          'https://github.com/leanflutter/flutter_apps/blob/main/source/apps/$slug/$slug-icon.png?raw=true'
    });
  }

  @override
  final String slug;

  @override
  final String name;

  final String? description;

  final String? website;

  final String? repository;

  final String? icon;

  final List<String>? platforms;

  final String? category;

  Map<String, dynamic> toJson() {
    return _$FlutterAppToJson(this)..removeWhere((key, value) => value == null);
  }
}
