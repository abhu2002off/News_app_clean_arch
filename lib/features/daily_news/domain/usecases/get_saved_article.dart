import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetSavedArticlesUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticlesUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    // TODO: implement call
    return _articleRepository
        .getSavedArticles(); //we get the data form the repository and return it
  }
}
