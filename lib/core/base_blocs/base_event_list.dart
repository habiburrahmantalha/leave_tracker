import 'package:equatable/equatable.dart';

/// Abstract base class for all list events.
///
/// This class extends [Equatable] to provide value equality
/// for derived classes, which allows for efficient event
/// comparison in state management.
abstract class BaseEventList extends Equatable {
  /// Creates an instance of [BaseEventList].
  const BaseEventList();
}

/// Event to retrieve a list of items.
///
/// This event can be used to fetch a list from an API or
/// database, with optional pagination support.
///

class GetListEvent extends BaseEventList {
  /// [page] - The page number to fetch, if pagination is used.
  final int? page;
  /// Creates an instance of [GetListEvent].
  const GetListEvent({this.page});

  @override
  List<Object?> get props => [page];
}

/// Event to reset the list.
///
/// This event can be used to reset the current list state
/// to its initial values or clear any existing data.
class ResetListEvent extends BaseEventList {
  /// Creates an instance of [ResetListEvent].
  const ResetListEvent();
  @override
  List<Object?> get props => [];
}