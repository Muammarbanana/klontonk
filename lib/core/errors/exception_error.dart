import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exception_error.g.dart';

class InternetFailure extends Equatable implements Exception {
  final String message = 'Not Connected to The Internet';

  @override
  List<Object?> get props => [message];
}

@JsonSerializable()
class ServerFailure extends Equatable implements Exception {
  const ServerFailure({
    this.traceId,
    this.code,
    this.message,
    this.payload,
  });

  factory ServerFailure.fromJson(Map<String, dynamic> json) =>
      _$ServerFailureFromJson(json);

  @JsonKey(name: 'traceId')
  final String? traceId;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'payload', defaultValue: '')
  final String? payload;

  Map<String, dynamic> toJson() => _$ServerFailureToJson(this);

  @override
  List<Object?> get props => [traceId, code, message, payload];
}

@JsonSerializable()
class RequestFailure extends Equatable implements Exception {
  const RequestFailure({
    required this.traceId,
    required this.code,
    required this.message,
    required this.payload,
  });

  factory RequestFailure.fromJson(Map<String, dynamic> json) =>
      _$RequestFailureFromJson(json);
  @JsonKey(name: 'traceId')
  final String traceId;
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'payload')
  final Payload payload;

  Map<String, dynamic> toJson() => _$RequestFailureToJson(this);

  @override
  List<Object?> get props => [traceId, code, message, payload];
}

@JsonSerializable()
class Payload extends Equatable {
  const Payload({required this.param});

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
  @JsonKey(name: 'param')
  final String param;

  Map<String, dynamic> toJson() => _$PayloadToJson(this);

  @override
  List<Object?> get props => [param];
}

class FormatFailure extends Equatable implements Exception {
  const FormatFailure({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
