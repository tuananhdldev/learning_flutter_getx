import 'package:get/get.dart';

class UserProvider extends GetConnect {
  Future<List<dynamic>> getUser(int page) async {
    final response =
        await get("https://randomuser.me/api/?page=$page&results=10");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return response.body['results'];
    }
  }
}
