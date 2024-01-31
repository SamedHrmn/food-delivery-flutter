abstract class UseCase<T, Params> {
  Future<T> call(Params p);
}
