import 'package:flutter/material.dart';
import 'package:flutter_application_1/auto/domain/entities/video_post.dart';
import 'package:flutter_application_1/auto/infrastructure/models/local_video_model.dart';
import 'package:flutter_application_1/auto/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {

  //todo: repository, datasource

  bool initialLoading = true;
  List <VideoPost> videos = [];

  Future <void> loadNextPage() async {

    await Future.delayed(const Duration(seconds: 2));
    
    final List<VideoPost> newVideos = videoPosts.map( 
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    videos.addAll( newVideos );
    initialLoading = false;
    notifyListeners();  
  }
}