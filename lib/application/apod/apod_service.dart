import '../../domain/entities/apod.dart';
import '../../domain/use_cases/get_apod_for_date.dart';

class ApodService {
  final GetApodForDate _getApodForDate;

  ApodService(
    this._getApodForDate,
  );

  Future<Apod> getApodForDate(DateTime date) async {
    return await _getApodForDate.execute(date);
  }
}
