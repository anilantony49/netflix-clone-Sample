part of 'hotandnew_bloc.dart';

@freezed
class HotandnewState with _$HotandnewState {
  const factory HotandnewState({
    required List <HotAndNewData> commingSoonList,
    required List <HotAndNewData> everyOneIsList,
    required bool isLoading,
    required bool isError
  }) = _Initial;

  factory HotandnewState.initial()=>const  HotandnewState(
    commingSoonList:[],
     everyOneIsList: [],
      isError: false,
       isLoading: false);
}
