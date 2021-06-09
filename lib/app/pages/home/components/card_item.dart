import 'dart:math';

import 'package:flask_reqsts/app/models/image_model.dart';
import 'package:flask_reqsts/shared.dart';
import 'package:like_button/like_button.dart';

class CardItem extends StatefulWidget {
  final Size size;
  final int index;
  ImageModel image;
  CardItem(
    this.size,
    this.index,
    this.image, {
    Key? key,
  }) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff984063),
          gradient: LinearGradient(
            colors: [
              Color(0xff355c7d),
              // Colors.black,
              Color(0xffc56cb6),
            ],
          ),
        ),
        child: ListTile(
          // .only(color: Color(0xff984063)),
          onTap: () async {
            ImageModel _image = await controller.do_like(this.widget.image);
            setState(() {
              this.widget.image = _image;
            });
          },
          title: Text(
            widget.image.title,
            style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
          ),
          isThreeLine: true,
          subtitle: Column(
            children: [
              Text(
                // 'This is an image description as you view this, is comming from api witch i wrote from flask api ',
                widget.image.description,
                style: TextStyle(
                  color: Color(0xfffe9677),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'views',
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                      Text("${widget.image.views}"),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Likes ${widget.image.likes}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          LikeButton(
                            size: 24,
                            circleColor: CircleColor(
                              start: Colors.white,
                              end: Colors.amberAccent,
                            ),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Color(0xff33b5e5),
                              dotSecondaryColor: Color(0xff0099cc),
                            ),
                            likeBuilder: (bool isLiked) {
                              return Icon(Icons.thumb_up_alt_outlined,
                                  color: Colors.redAccent);
                            },
                            likeCount: widget.image.likes,
                            // onTap: controller!.make_like()
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.primaries[Random().nextInt(7)],
              ),
              width: widget.size.width * 0.23,
              height: widget.size.height * 0.23,
            ),
          ),
          hoverColor: Colors.primaries[3],
          // tileColor: Colors.amberAccent.withOpacity(0.2),
        ),
      ),
    );
  }
}
