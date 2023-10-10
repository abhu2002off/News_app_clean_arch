import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

import 'features/daily_news/data/data_sources/local/app_database.dart';
import 'features/daily_news/domain/usecases/get_saved_article.dart';

final s1 = GetIt
    .instance; // define the instance globally so we can access this instance in all files and anywhere

Future<void> initializeDependencies() async {
  // it will be called before run app where all classes and contracts will get registered
// subsequently also injected using the singleton instance of get it stored inside SL using getit classes
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  s1.registerSingleton<AppDatabase>(database);
//Dio
  s1.registerSingleton<Dio>(Dio());
//Dependencies
  s1.registerSingleton<NewsApiService>(NewsApiService(s1()));

  s1.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(s1(), s1()));

  //UseCase
  s1.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(s1()));

  s1.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(s1()));

  s1.registerSingleton<SaveArticlesUseCase>(SaveArticlesUseCase(s1()));

  s1.registerSingleton<RemoveArticlesUseCase>(RemoveArticlesUseCase(s1()));

  //Blocs
  s1.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(s1()));

  s1.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(s1(), s1(), s1()));
}
