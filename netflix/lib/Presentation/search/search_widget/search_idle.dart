import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Application/search/search_bloc.dart';


import 'package:netflix/core/constants.dart';

import 'title.dart';


class searchIdleWidget extends StatelessWidget {
  const searchIdleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const searchTilewidget(
          title: 'Top Searches',
          
        ),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc,SearchState>(
            builder: (context, state) {
              if(state.isLoading||state.isError||state.idleList.isEmpty){
                return const Center(child: CircularProgressIndicator(),);
              // }else if(state.isError||state.idleList.isEmpty){
                //  return const Center(child: Text('Error While getting data'),);
              // }else if(state.idleList.isEmpty){
              //    return const Center(child: Text('List is Empty'),);
              }
              
           
            return ListView.separated(
             shrinkWrap: true,
              itemBuilder: (context, index) {
                final movie= state.idleList[index];
                return TopSearchItemTile(title: movie.title??'No Title Provided', imageUrl:'$imageappendUrl${movie.posterPath}');
              },
               separatorBuilder:  (context, index) => k25height, 
              itemCount:state.idleList.length);
            },
          ),
        )
       
        
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile({
    Key? key,
     required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.37,
          height: 90,
          // color: Colors.red,
          decoration: BoxDecoration(borderRadius:BorderRadius.circular(7),
              image: DecorationImage(
                
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        kwidth,
        Expanded(
          child: Text(
            
           title,
          //  maxLines: 2,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Icon(
          Icons.play_circle,
          color: Colors.grey,
          size: 35,
        )
      ],
    );
  }
}
