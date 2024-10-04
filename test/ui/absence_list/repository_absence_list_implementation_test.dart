import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/core/network/api_endpoint.dart';
import 'package:leave_tracker/core/network/dio_singleton.dart';
import 'package:leave_tracker/ui/absence_list/data/models/response_absence_list_model.dart';
import 'package:leave_tracker/ui/absence_list/domain/repositories/repository_absence_list.dart';
import 'package:leave_tracker/ui/absence_list/data/repositories/repository_absence_list_implementation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

class MockDio extends Mock implements DioSingleton {}

void main() {
  late RepositoryAbsenceListImplementation repository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    repository = RepositoryAbsenceListImplementation();

    // Override Dio's instance within DioSingleton with a mock response
    when(() => DioSingleton.instance).thenReturn(mockDio);
  });

  group('RepositoryAbsenceListImplementation', () {
    test('returns ResponseAbsenceListModel when getAbsenceList is called successfully', () async {
      const String filter = 'status=approved';
      final Map<String, dynamic> mockResponseData = {
        "absences": [
          {"id": 1, "type": "Sick Leave", "status": "Approved"},
          {"id": 2, "type": "Vacation", "status": "Approved"}
        ]
      };

      // Mock Dio response
      when(() => mockDio.get(ApiEndpoint.absences(filter)))
          .thenAnswer((_) async => Response(
        data: mockResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiEndpoint.absences(filter)),
      ));

      final response = await repository.getAbsenceList(filter);

      expect(response, isA<ResponseAbsenceListModel>());
      expect(response.absences.length, 2);
      expect(response.absences.first.type, 'Sick Leave');
    });

    test('throws an exception when Dio throws an error', () async {
      const String filter = 'status=approved';

      when(() => mockDio.get(ApiEndpoint.absences(filter)))
          .thenThrow(DioError(
        requestOptions: RequestOptions(path: ApiEndpoint.absences(filter)),
        error: 'Something went wrong!',
      ));

      expect(
            () async => await repository.getAbsenceList(filter),
        throwsA(isA<DioError>()),
      );
    });
  });
}
