abstract class NewsState{

}
class NewsLoadingState extends NewsState{

}
class NewsLoadedState extends NewsState{
  List<Map<String,dynamic>> articles;
  NewsLoadedState(this.articles){}
}
class NewsErrorState extends NewsState{
  String errorMessage;
  NewsErrorState(this.errorMessage){}
}