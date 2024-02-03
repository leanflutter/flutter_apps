import 'package:makeapplist/makeapplist.dart';

Future<void> main(List<String> args) async {
  final makeAppList = MakeAppList();
  await makeAppList.make();
}
