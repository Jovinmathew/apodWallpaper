import '../entities/apod.dart';

abstract class ApodRepository {
  Future<Apod> getApodForDate(DateTime date);
  Future<void> saveApodAsWallpaper(Apod apod);
}
