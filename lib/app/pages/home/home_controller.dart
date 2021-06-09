import 'dart:async';

import 'package:flask_reqsts/app/models/image_model.dart';
import 'package:flask_reqsts/shared.dart';

class HomeController extends GetxController with StateMixin {
  final FlaskRepository repository;
  HomeController({required this.repository}); // : assert(repository != null);
  final _is_like = false.obs;
  get likes => this._likes.value;
  final _likes = 123.obs;
  set is_like(value) => this._is_like.value = value;
  get is_like => this._is_like.value;

  final _images = <ImageModel>[].obs;

  get images => this._images.value;
  set images(value) => this._images.value = value;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeController && other.repository == repository;
  }

  @override
  int get hashCode => repository.hashCode;

  Future<bool> make_like(bool isliked) async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      print('liking...');
      this._likes.value++;
      print('liked $_likes');
    });
    return _is_like.value;
  }

  @override
  void onInit() {
    super.onInit();
    get_images();
  }

  Future<void> get_images() async {
    change([], status: RxStatus.loading());
    try {
      final data = await repository.getAllVideos();
      _images.value = data;
      change(this.images, status: RxStatus.success());
    } catch (err) {
      change([], status: RxStatus.error('Erro ao fazer requisicao'));
    }
  }

  Future<ImageModel> do_like(ImageModel image) async {
    ImageModel _image = image.copyWith(likes: image.likes + 2);

    try {
      ImageModel img_ = await repository.makeLike(_image);
      // get_images();
      return img_;
    } catch (err) {
      Get.snackbar(
          "Actualizacoa", 'Erro na actualizacoa da image , devido a :$err',
          backgroundColor: Colors.white, snackPosition: SnackPosition.BOTTOM);
      return image;
    }
  }
}
