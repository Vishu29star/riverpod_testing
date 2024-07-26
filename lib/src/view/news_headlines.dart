import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_models/news_viewmodel.dart';

class NewsHeadLine extends ConsumerWidget {
  const NewsHeadLine({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final newsState = ref.watch(newsViewModelProvider);
    final newsState = ref.watch(autoNewsModelProvider('us'));

    return Scaffold(
      appBar: AppBar(title: Text("News"),actions: [TextButton(onPressed: (){
        ref.read(autoNewsModelProvider('us').notifier).getEveryThing(query: "apple");
      }, child: Text("Fetch Everrything"))],),
      body: newsState.when(
        data: (articles) => ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return ListTile(
              title: Text(article.title ?? "Title"),
              subtitle: Text(article.description ?? "Description"),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
    );
  }

}