import '../../../data/repositories/movie_repository.dart';
import '../../entities/actor.dart';
import '../../entities/result.dart';
import 'get_actors_param.dart';
import '../usecase.dart';

class GetActors implements UseCase<Result<List<Actor>>, GetActorsParam> {
  final MovieRepository _movieRepository;

  GetActors({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<List<Actor>>> call(GetActorsParam params) async {
    var actorsListResult = await _movieRepository.getActors(id: params.movieId);

    return switch (actorsListResult) {
      Success(value: final actorList) => Result.success(actorList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
