import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
 
  const factory MainFailure.ClientFailure() = _ClientFailure;
  
  const factory MainFailure.ServerFailure() = _ServerFailure;
}
