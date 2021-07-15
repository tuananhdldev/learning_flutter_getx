import 'package:flutter/material.dart';

import 'package:learning_getx/app/models/user_model.dart';

class UserDetail extends StatelessWidget {
  late final Results user;
  late final int index;

  UserDetail({required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: SafeArea(
          bottom: false,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.93,
            width: MediaQuery.of(context).size.width,
            child: Stack(

              children: [
                Positioned(
                    bottom: 0,
                    child: Container(

                      height: MediaQuery.of(context).size.height * 0.85,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xfffff8ee),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1,
                            left: 10,
                            right: 10),
                        child: Column(
                          children: [
                            Text(
                              user.name!.title! + ' ' +user.name!.first! + ' ' + user.name!.last!,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Age: ' + user.dob!.age.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                            Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'email: ' + user.email!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1.5),
                                ), Text(
                                  'gender: ' + user.gender!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1.5),
                                ), Text(
                                  'country: ' + user.location!.country!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1.5),
                                ), Text(
                                  'city: ' + user.location!.city!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      height: 1.5),
                                ),

                              ],
                            ),
                            SizedBox(height: 30,),
                            Expanded(child: SingleChildScrollView(
                              child: Container(
                                  alignment: Alignment.bottomCenter,

                                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer luctus sapien sit amet lacus molestie, eu hendrerit metus interdum. Suspendisse a urna dui. Phasellus elementum ornare ipsum at aliquet. Maecenas bibendum odio et enim tempus tincidunt ut eu massa. Praesent lectus est, iaculis non ligula in, suscipit ultrices eros. Integer aliquam fermentum felis quis consectetur. In venenatis tempor diam nec suscipit. Proin auctor lorem ac est maximus, ac accumsan risus mollis. Quisque fermentum purus aliquam magna vestibulum congue.In iaculis lorem id tortor scelerisque tempor. Quisque ante quam, mattis ut eros et, lacinia volutpat lorem. Maecenas id venenatis est. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed accumsan dignissim arcu quis posuere. Suspendisse sed efficitur ante, et molestie augue. Suspendisse eget porta ipsum. Maecenas porta ipsum eget euismod elementum. Vestibulum a placerat magna, sed pellentesque lacus. Nullam vestibulum mauris justo, quis pulvinar neque ultrices non. Donec fermentum congue urna, eu molestie massa venenatis sed. Donec a arcu nec ligula facilisis venenatis. Curabitur vel sagittis ex. Donec sed eros leo.In hac habitasse platea dictumst. Vivamus ac venenatis massa, non gravida metus. Nunc sit amet enim nulla. Nunc molestie pharetra nisi non consectetur. Cras ac ultricies est. Praesent diam tortor, scelerisque sed dui elementum, faucibus egestas magna. Cras gravida tortor nulla, id tempor elit lacinia a.Maecenas auctor libero in congue consequat. Sed suscipit suscipit odio quis suscipit. Nulla nec lacus fringilla quam dignissim molestie a sit amet nisl. Sed consequat vulputate vestibulum. Maecenas dignissim at ante laoreet laoreet. Integer porta est tristique luctus varius. Integer quis purus nunc. Donec id fermentum ante. Pellentesque lacinia nunc ut euismod rhoncus. In dignissim volutpat mauris, eu vehicula diam iaculis sed. Ut ac vehicula massa, id aliquet nibh. Donec pellentesque magna vitae mollis bibendum. Mauris auctor justo vel gravida dapibus. Donec imperdiet libero at purus mollis gravida in luctus quam. Pellentesque suscipit sapien et fringilla tristique. Donec in purus congue, interdum neque at, ultricies mi ")),
                            ))
                          ],
                        ),
                      ),
                    )
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.2,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Hero(
                    tag: "image$index",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        user.picture?.large ?? "",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
