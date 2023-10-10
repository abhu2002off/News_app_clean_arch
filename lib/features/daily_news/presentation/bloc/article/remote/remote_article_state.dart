import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticleLoading extends RemoteArticlesState {
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticlesState {
  const RemoteArticleDone(List<ArticleEntity> article)
      : super(articles: article);
}

class RemoteArticleError extends RemoteArticlesState {
  const RemoteArticleError(DioException error) : super(error: error);
}
