import 'package:get/get.dart';
import 'package:learning_getx/app/providers/user_provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  var lstUser = List<dynamic>.empty(growable: true).obs;
  var page = 1;
  var isloamore = true;

  @override
  void onInit() {
    super.onInit();
    getdata();
  }

  void getdata({bool isRefresh = false}) {
    if (isRefresh) page = 1;
    if (isloamore) {
      UserProvider().getUser(page).then((value) {
        if (value.isEmpty) {
          isloamore = false;
          change(value, status: RxStatus.empty());
        }
        if (isRefresh) {
          lstUser = List<dynamic>.empty().obs;
        }
        lstUser.addAll(value);
        change(lstUser, status: RxStatus.success());
        page++;
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    }
  }
}
