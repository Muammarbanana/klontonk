// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerFailure _$ServerFailureFromJson(Map<String, dynamic> json) =>
    ServerFailure(
      traceId: json['traceId'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      payload: json['payload'] as String? ?? '',
    );

Map<String, dynamic> _$ServerFailureToJson(ServerFailure instance) =>
    <String, dynamic>{
      'traceId': instance.traceId,
      'code': instance.code,
      'message': instance.message,
      'payload': instance.payload,
    };

RequestFailure _$RequestFailureFromJson(Map<String, dynamic> json) =>
    RequestFailure(
      traceId: json['traceId'] as String,
      code: json['code'] as String,
      message: json['message'] as String,
      payload: Payload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestFailureToJson(RequestFailure instance) =>
    <String, dynamic>{
      'traceId': instance.traceId,
      'code': instance.code,
      'message': instance.message,
      'payload': instance.payload,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      param: json['param'] as String,
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'param': instance.param,
    };
