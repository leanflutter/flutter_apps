import 'package:app_list_maker/app_list_maker.dart';

class MakeAppList {
  final AppListMaker _appListMaker = AppListMaker();

  Future<void> make() async {
    return _appListMaker.make();
  }
}
