import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: 200,
        //  color: Colors.red,
        child: Image.network(
          url,
          fit: BoxFit.fill,
          loadingBuilder:
              (BuildContext _, Widget child, ImageChunkEvent? progress) {
            if (progress == null) {
              return child;
            } else {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2,),
              );
            }
          },
          errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
            return const Center(
              child: Icon(Icons.wifi_off,color: Colors.grey,),
            );
          },
        ),
      ),
      Positioned(
        // top: 0,
        right: 10,
        bottom: 5,
        child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(.1),
            radius: 30,
            child: IconButton(
                color: KwhiteColor,
                onPressed: () {},
                icon: const Icon(Icons.volume_off))),
      ),
    ]);
  }
}
