import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Application/downloads/downloads_bloc.dart';
import 'package:netflix/Presentation/widgets/appbar_widget.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class screenDownloads extends StatelessWidget {
  screenDownloads({Key? key}) : super(key: key);
  final _widgetList = [
    const _Smartdownloads(),
    const section2(),
    const section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: appbarwidget(
            title: 'Downloads',
          )),
      body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (ctx, index) => _widgetList[index],
          separatorBuilder: (ctx, index) => const SizedBox(
                height: 25,
              ),
          itemCount: _widgetList.length),
    );
  }
}

class section2 extends StatelessWidget {
  const section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadEvent.getDownloadsImage());
    });

    final Size size = MediaQuery.of(context).size;
    return Column(children: [
      const Center(
        child: Text('Indroducing Downloads for you',
            style: TextStyle(
                color: KwhiteColor, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      kheight,
      const Text(
        "we'll download a personalised selection of\n movies and shows for you,so there's\n always something to watch on your\n device.",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
      // kheight,

      BlocBuilder<DownloadsBloc, DownloadState>(builder: (context, state) {
        return
            // if(state.downloads.isEmpty){
            //   return  const Center(child: Text('List is Empty'),);
            // }

            SizedBox(
                width: size.width,
                height: 280,
                child: state.isLoading || state.downloads.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ))
                    : Stack(alignment: Alignment.center, children: [
                        CircleAvatar(
                          radius: size.width * .30,
                          backgroundColor: Colors.grey[800],
                        ),
                        DownloadsImageWidget(
                          margin: const EdgeInsets.only(left: 120, top: 5),
                          imagelist:
                              '$imageappendUrl${state.downloads[1].posterPath}',
                          angle: 20,
                          height: 150,
                          width: 130,
                        ),
                        DownloadsImageWidget(
                          margin: const EdgeInsets.only(right: 120, top: 5),
                          imagelist:
                              '$imageappendUrl${state.downloads[2].posterPath}',
                          angle: -20,
                          height: 150,
                          width: 130,
                        ),
                        DownloadsImageWidget(
                          margin: const EdgeInsets.only(bottom: 40, top: 68),
                          imagelist:
                              '$imageappendUrl${state.downloads[3].posterPath}',
                          height: 175,
                          width: 130,
                        )
                      ]));
      })
    ]);
  }
}

// ignore: camel_case_types
class section3 extends StatelessWidget {
  const section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        child: MaterialButton(
          color: kbuttonColorblue,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Set up',
              style: TextStyle(
                  color: KwhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      kheight,
      MaterialButton(
          color: kbuttonColorwhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See what you can download',
                style: TextStyle(
                    color: kblackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ))),
    ]);
  }
}

class _Smartdownloads extends StatelessWidget {
  const _Smartdownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      kwidth,
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Icon(
          Icons.settings,
          color: KwhiteColor,
        ),
      ),
      kwidth,
      Text('Smart Downloads',
          style: TextStyle(
              color: KwhiteColor, fontSize: 17, fontWeight: FontWeight.bold))
    ]);
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      this.angle = 0,
      required this.imagelist,
      required this.margin,
      required this.width,
      required this.height})
      : super(key: key);

  final double angle;
  final String imagelist;
  final EdgeInsets margin;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: margin,
        child: Transform.rotate(
          angle: angle * pi / 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Container(
              // margin: margin,
              //  alignment: Alignment.center,
              width: width,
              height: height,

              // color: Colors.black,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: NetworkImage(imagelist), fit: BoxFit.cover)),
            ),
          ),
        ));
  }
}
