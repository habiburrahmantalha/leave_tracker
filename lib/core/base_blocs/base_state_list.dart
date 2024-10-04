import 'package:equatable/equatable.dart';
import 'package:leave_tracker/core/constants/enums.dart';

abstract class BaseStateList extends Equatable {

  final LoadingStatus status;

  final int? currentPage;
  final int? totalPage;
  final int? totalCount;

  bool hasNextPage() {
    return (currentPage ?? 0) < (totalPage ?? 0);
  }

  const BaseStateList({
    this.status = LoadingStatus.initial,
    this.currentPage,
    this.totalPage,
    this.totalCount,
  });

  BaseStateList copyWith({
    final LoadingStatus? status,
    final int? currentPage,
    final int? totalPage,
    final int? totalCount,
  });
}