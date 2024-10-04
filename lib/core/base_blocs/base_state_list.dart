import 'package:equatable/equatable.dart';
import 'package:leave_tracker/core/constants/enums.dart';

/// Abstract base class for all list state.
abstract class BaseStateList extends Equatable {


  /// The current loading status.
  final LoadingStatus status;

  /// The current page number.
  final int? currentPage;

  /// The total number of pages available.
  final int? totalPage;

  /// The total number of items.
  final int? totalCount;

  ///Function to check is theres a next page available
  bool hasNextPage() {
    return (currentPage ?? 0) < (totalPage ?? 0);
  }

  /// Creates an instance of [BaseStateList].
  const BaseStateList({
    this.status = LoadingStatus.initial,
    this.currentPage,
    this.totalPage,
    this.totalCount,
  });

  /// Creates a copy of the current state with modified properties.
  BaseStateList copyWith({
    final LoadingStatus? status,
    final int? currentPage,
    final int? totalPage,
    final int? totalCount,
  });
}