// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlutterApp _$FlutterAppFromJson(Map<String, dynamic> json) => FlutterApp(
      slug: json['slug'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      website: json['website'] as String?,
      repository: json['repository'] as String?,
      icon: json['icon'] as String?,
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$FlutterAppToJson(FlutterApp instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'description': instance.description,
      'website': instance.website,
      'repository': instance.repository,
      'icon': instance.icon,
      'platforms': instance.platforms,
      'category': instance.category,
    };
