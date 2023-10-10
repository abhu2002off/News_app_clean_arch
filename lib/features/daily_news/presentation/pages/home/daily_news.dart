import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/widgets/article_tile.dart';

import '../../bloc/article/remote/remote_article_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildbody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        GestureDetector(
            onTap: () => _onShowSavedArticlesViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(
                Icons.bookmark,
                color: Colors.black,
              ),
            ))
      ],
    );
  }

  _buildbody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
        builder: (_, state) {
      if (state is RemoteArticleLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteArticleError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteArticleDone) {
        print(state.articles![1].author);

        return ListView.builder(
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: state.articles![index],
              onArticlePressed: (article) =>
                  _onArticlePressed(context, article),
            );
          },
          itemCount: state.articles!.length,
        );
      }
      return const SizedBox();
    });
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    print("article: ${article.urlToImage}");
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
