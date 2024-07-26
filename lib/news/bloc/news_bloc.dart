import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'news_state.dart';

class NewsBloc extends Cubit<NewsState>{

  NewsBloc() : super(NewsLoadingState()){
    emit(NewsLoadingState());
    getArticles();
  }

  Future<void> getArticles() async{
    emit(NewsLoadingState());
    String apikey = "8212248bcdf94e44bf503be09e14e199";
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apikey";
    Uri uri = Uri.parse(url);
   try{
     final response = await http.get(uri);
     if(response.statusCode == 200){
       List<Map<String, dynamic>> articles  =  (jsonDecode(response.body)["articles"] as List).map((e) => e as Map<String, dynamic>).toList();

       print("articles");
       print(articles);
       emit(NewsLoadedState(articles));
     }else{
       String error = "Error ${response.statusCode}";
       print(error);
       emit(NewsErrorState(error));
     }
   }catch(e){
     String error = "Error $e";
     print(error);
     emit(NewsErrorState(error));
   }
  }
}