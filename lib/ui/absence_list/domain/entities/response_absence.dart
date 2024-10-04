import 'absence.dart';

/// Represents the response containing a list of absences.
///
/// This class encapsulates the data returned from the absence list API,
/// including the absences themselves, pagination information, and the
/// total count of absences.
class ResponseAbsenceList {
  /// A list of [Absence] objects representing the absences.
  final List<Absence> list;

  /// The current page of the absence list.
  final int currentPage;

  /// The total number of pages available for the absence list.
  final int totalPage;

  /// The total number of absences available in the response.
  final int totalCount;

  /// Creates a new instance of [ResponseAbsenceList].
  ///
  /// Requires [list], [currentPage], [totalPage], and [totalCount]
  /// to be provided during instantiation.
  ResponseAbsenceList({
    required this.list,
    required this.currentPage,
    required this.totalPage,
    required this.totalCount,
  });
}