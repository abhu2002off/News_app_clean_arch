import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticlesUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    // TODO: implement call
    return _articleRepository.getNewsArticles();//we get the data form the repository and return it
  }
}
