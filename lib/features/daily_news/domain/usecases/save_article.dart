import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/usecases/usecase.dart';

class SaveArticlesUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticlesUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    // TODO: implement call
    return _articleRepository.saveArticle(
        params!); //we get the data form the repository and return it
  }
}
