import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_project/news/bloc/news_bloc.dart';

import '../bloc/news_state.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});
  static Widget create() {
    return BlocProvider(
        create: (BuildContext context) => NewsBloc(),
        child:NewsListScreen() );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News List Screen"),),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context){
    return BlocConsumer<NewsBloc,NewsState>(builder: (context,state){
      if(state is NewsLoadingState){
        return Center(child: CircularProgressIndicator(),);
      }
      if(state is NewsErrorState){
        return Center(child: Text(state.errorMessage),);
      }
      if(state is NewsLoadedState){
        List<Map<String,dynamic>> articles = state.articles;
        return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context,index){
              return NewsItem(article: articles[index]);
            });
      }
      return Center(child: Text("something wrong"),);
    }, listener: (context,state){

    });
  }
}

class NewsItem extends StatelessWidget {
  final Map<String,dynamic> article;
  const NewsItem({required this.article,super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article['title'] ?? "title"),
      subtitle: Text(article['description'] ?? "description"),
    );
  }
}

