import '../entities/apod.dart';
import '../repositories/apod_repository.dart';

class GetApodForDate {
  final ApodRepository repository;

  GetApodForDate(this.repository);

  Future<Apod> execute(DateTime date) async {
    return await repository.getApodForDate(date);
  }
}
