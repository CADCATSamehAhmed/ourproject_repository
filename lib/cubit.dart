import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicanto/states.dart';
import 'musicModel.dart';

class MusicCubit extends Cubit<MusicStates> {

  MusicCubit() :super(MusicInitialState());

  static MusicCubit get(context) => BlocProvider.of(context);

  AudioPlayer player = AudioPlayer();

  void playMusic(String pass)
  {
    player.play(AssetSource(pass));
    emit(PlayMusicState());
  }

  void pauseMusic()
  {
    player.pause();
    emit(PauseMusicState());
  }

  void seekTo(String pass)
  {
    player.play(AssetSource(pass));
    emit(PauseMusicState());
  }

}