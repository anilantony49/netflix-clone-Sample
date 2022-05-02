part of 'hotandnew_bloc.dart';

@freezed
class HotandnewEvent with _$HotandnewEvent {
  const factory HotandnewEvent.loadDataInComigSoon() = LoadDataInComigSoon;
   const factory HotandnewEvent.loadDataInEveryOnesWatching() = LoadDataInEveryOnesWatching;
}