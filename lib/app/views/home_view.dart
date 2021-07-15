import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/app/controllers/home_controller.dart';
import 'package:learning_getx/app/models/user_model.dart';
import 'package:learning_getx/app/views/details_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends GetView<HomeController> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        centerTitle: true,
      ),
      body: controller.obx(
          (data) => SmartRefresher(
                controller: refreshController,
                header: WaterDropHeader(),
                enablePullUp: true,
                enablePullDown: true,
                onRefresh: () {
                  controller.getdata(isRefresh: true);
                  if (controller.status.isSuccess) {
                    refreshController.refreshCompleted();
                  } else
                    refreshController.refreshFailed();
                },
                onLoading: () {
                  print("get more data at page ${controller.page}");
                  controller.getdata();
                  if (controller.status.isSuccess) {
                    refreshController.loadComplete();
                  } else
                    refreshController.loadFailed();
                },
                child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: data!.length,
                    itemBuilder: (ctx, index) {
                      print("${data.length}");
                      return Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            ListTile(
                              tileColor: Colors.white,
                              leading: Hero(
                                tag: "image$index",
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      data[index]['picture']['large']),
                                ),
                              ),
                              title: Text(data[index]['name']['title'] +
                                  " " +
                                  data[index]['name']['first'] +
                                  " " +
                                  data[index]['name']['last']),
                              subtitle: Text(
                                data[index]['email'],
                                style: TextStyle(fontSize: 12),
                              ),
                              trailing: Text(
                                  "Age: ${data[index]['dob']['age'].toString()}"),
                              onTap: () {
                                final result = Results.fromJson(data[index]);
                                Get.to(() => UserDetail(user: result, index: index,) );
                                // final param = <String, String>{
                                //   "data": data[index].toString()
                                // };
                                // Get.toNamed(Routes.DETAIL, parameters: param);

                                //  print(data[index]);
                              },
                            )
                          ],
                        ),
                      );
                    }),
              ),
          onError: (error) => Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('connect server error!!!'),
                    ElevatedButton(
                        onPressed: () => controller.onInit(),
                        child: Text("retry"))
                  ],
                ),
              )),
    );
  }
}
