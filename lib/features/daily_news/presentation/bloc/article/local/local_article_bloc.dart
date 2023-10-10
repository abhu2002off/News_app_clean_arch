import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

import '../../../../domain/usecases/get_saved_article.dart';
import '../../../../domain/usecases/remove_article.dart';
import 'local_article_event.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticlesUseCase _getSavedArticleUseCase;
  final SaveArticlesUseCase _saveArticlesUseCase;
  final RemoveArticlesUseCase _removeArticlesUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._removeArticlesUseCase,
      this._saveArticlesUseCase)
      : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async {
    await _removeArticlesUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<LocalArticleState> emit) async {
    await _saveArticlesUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
