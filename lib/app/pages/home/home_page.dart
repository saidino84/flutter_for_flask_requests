import 'dart:math';

import 'package:flask_reqsts/app/models/image_model.dart';
import 'package:flask_reqsts/shared.dart';
import 'package:like_button/like_button.dart';

import 'components/card_item.dart';

class HomePage extends GetView<HomeController> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff41436a),
      appBar: AppBar(
        title: Text('Requests'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: size.height * 0.080,
                child: Container(
                  color: Colors.primaries[5],
                  width: double.infinity,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 10,
                height: size.height * 0.6,
                child: controller.obx((state) {
                  List<ImageModel> images = state;

                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (ctx, index) =>
                          CardItem(size, index, images[index]),
                    ),
                  );
                }, onError: (err) {
                  return Center(
                      child: Column(
                    children: [
                      Text('Erro %err'),
                      ElevatedButton(
                        onPressed: () => controller.get_images(),
                        child: Text('Try again'),
                      ),
                    ],
                  ));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
