import 'package:flutter/material.dart';
import 'package:netflix/Presentation/widgets/custom_widget.dart';
import 'package:netflix/Presentation/widgets/videoWidget.dart';
import 'package:netflix/core/constants.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String moviename;
  final String discription;

  const ComingSoonWidget(
      {Key? key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterpath,
      required this.moviename,
      required this.discription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                day,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
            //  margin: EdgeInsets.only(bottom: 140),

            width: size.width - 70,
            height: 450,
            // color: Colors.blue,
            // decoration: ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              VideoWidget(url: posterpath,),
                kheight,
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        moviename,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          // letterSpacing: -2,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //  const Spacer(),
                 const  CustomIconWIdget(
                      icon: Icons.alarm,
                      iconsize: 22,
                      title: 'Remind me',
                      textSize: 12,
                    ),
                    kwidth,
                const     CustomIconWIdget(
                      icon: Icons.info_outline,
                      iconsize: 22,
                      title: 'Info',
                      textSize: 12,
                    ),
                    kwidth
                  ],
                ),
                kheight,
                Text('Coming on $day $month'),
                kheight,
                Text(
                  moviename,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                kheight,
                Text(
                  discription,
                  maxLines: 4,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ))
      ],
    );
  }
}
