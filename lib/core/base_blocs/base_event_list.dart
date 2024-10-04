import 'package:equatable/equatable.dart';

abstract class BaseEventList extends Equatable {
  const BaseEventList();
}

class GetListEvent extends BaseEventList {
  final int? page;
  const GetListEvent({this.page});

  @override
  List<Object?> get props => [page];
}

class ResetListEvent extends BaseEventList {
  const ResetListEvent();
  @override
  List<Object?> get props => [];
}