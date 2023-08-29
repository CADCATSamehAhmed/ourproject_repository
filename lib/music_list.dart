import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit.dart';
import 'musicModel.dart';
import 'states.dart';

class MusciList extends StatelessWidget {
  List<MusicModel> musix = [
    MusicModel(cover: 'assets/images/images1.jpg', author: 'unkown', musicName: 'desert', path: 'song1.mp3'),
    MusicModel(cover: 'assets/images/images1.jpg', author: 'unkown', musicName: 'desert', path: 'song1.mp3'),
    MusicModel(cover: 'assets/images/images1.jpg', author: 'unkown', musicName: 'desert', path: 'song1.mp3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder:(BuildContext context)=>BlocConsumer<MusicCubit,MusicStates>(
            listener: (context, state) {},
            builder: (context, state) =>Scaffold(
              appBar: AppBar(
                title: const Text("Music"),
                centerTitle: true,
              ),
              body:ListView.separated(
                itemBuilder: (context,index)=>musicItem(musix[index]),
                separatorBuilder: (context,index)=>Container(width: double.infinity,height: 3.0,color: Colors.grey,),
                itemCount: musix.length),
          ),
        ),
    );
  }
}
Widget musicItem(MusicModel model) {
  return InkWell(
    onTap: (){},
    child: Row(
      children: [
        CircleAvatar(backgroundImage: AssetImage(model.cover),),
        Expanded(
          child: Column(
            children: [
              Text(model.musicName,style: TextStyle(fontSize: 25.0),),
              Text(model.author,style: TextStyle(fontSize: 20.0,color: Colors.grey),),
            ]
          ),
        ),
        IconButton(onPressed: (){}, icon:Icon(Icons.queue) )
      ]
    ),
  );
}