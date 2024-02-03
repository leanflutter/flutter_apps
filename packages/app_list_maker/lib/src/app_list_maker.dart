import 'dart:convert';
import 'dart:io';
import 'package:app_list_maker/src/models/flutter_app.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

const _kMdMark = '<!-- APP_LIST_MAKER -->';

class AppListMaker {
  Future<void> make() async {
    List<FlutterApp> apps = [];
    Directory directory = Directory('source/apps');
    List<FileSystemEntity> entities = directory.listSync();
    for (FileSystemEntity entity in entities) {
      try {
        final appSlug = entity.path.split('/').last;
        final appInfoFile = File(path.join(entity.path, '$appSlug.yaml'));
        final appInfoYaml = loadYaml(appInfoFile.readAsStringSync());
        final app = FlutterApp.fromJson({
          'slug': appSlug,
          ...json.decode(json.encode(appInfoYaml)),
        });
        apps.add(app);
      } catch (error) {
        // skip
      }
    }

    apps.sort((a, b) => a.slug.compareTo(b.slug));

    String renderedString = apps.map((app) {
      return '''
[<img align="left" height="48px" width="48px" style="border-radius:50%" alt="${app.name}" src="${app.iconUrl}"/>](${app.website})

[**${app.name}**](${app.website}) \\
${app.description}
''';
    }).join('\n');

    File mdFile = File('README.md');
    String mdString = mdFile.readAsStringSync();

    int markIndexS = mdString.indexOf(_kMdMark) + _kMdMark.length;
    int markIndexE = mdString.lastIndexOf(_kMdMark);

    String newContent = '';
    newContent += mdString.substring(0, markIndexS);
    newContent += '\n$renderedString\n';
    newContent += mdString.substring(markIndexE);

    mdFile.writeAsStringSync(newContent);
  }
}
