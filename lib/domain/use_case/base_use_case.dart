import '../../core/util/result.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type>> execute([Params? params]);
}

class NoParams {
  const NoParams();
}
