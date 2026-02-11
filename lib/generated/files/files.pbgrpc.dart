// This is a generated file - do not edit.
//
// Generated from files.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'files.pb.dart' as $0;

export 'files.pb.dart';

@$pb.GrpcServiceName('FilesRpc')
class FilesRpcClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  FilesRpcClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.ResponseDto> putAvatar(
    $0.FileDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$putAvatar, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseDto> deleteAvatar(
    $0.FileDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteAvatar, request, options: options);
  }

  $grpc.ResponseStream<$0.FileDto> fetchAvatar(
    $0.FileDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$fetchAvatar, $async.Stream.fromIterable([request]),
        options: options);
  }

  // method descriptors

  static final _$putAvatar = $grpc.ClientMethod<$0.FileDto, $0.ResponseDto>(
      '/FilesRpc/PutAvatar',
      ($0.FileDto value) => value.writeToBuffer(),
      $0.ResponseDto.fromBuffer);
  static final _$deleteAvatar = $grpc.ClientMethod<$0.FileDto, $0.ResponseDto>(
      '/FilesRpc/DeleteAvatar',
      ($0.FileDto value) => value.writeToBuffer(),
      $0.ResponseDto.fromBuffer);
  static final _$fetchAvatar = $grpc.ClientMethod<$0.FileDto, $0.FileDto>(
      '/FilesRpc/FetchAvatar',
      ($0.FileDto value) => value.writeToBuffer(),
      $0.FileDto.fromBuffer);
}

@$pb.GrpcServiceName('FilesRpc')
abstract class FilesRpcServiceBase extends $grpc.Service {
  $core.String get $name => 'FilesRpc';

  FilesRpcServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FileDto, $0.ResponseDto>(
        'PutAvatar',
        putAvatar_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FileDto.fromBuffer(value),
        ($0.ResponseDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FileDto, $0.ResponseDto>(
        'DeleteAvatar',
        deleteAvatar_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FileDto.fromBuffer(value),
        ($0.ResponseDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FileDto, $0.FileDto>(
        'FetchAvatar',
        fetchAvatar_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.FileDto.fromBuffer(value),
        ($0.FileDto value) => value.writeToBuffer()));
  }

  $async.Future<$0.ResponseDto> putAvatar_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.FileDto> $request) async {
    return putAvatar($call, await $request);
  }

  $async.Future<$0.ResponseDto> putAvatar(
      $grpc.ServiceCall call, $0.FileDto request);

  $async.Future<$0.ResponseDto> deleteAvatar_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.FileDto> $request) async {
    return deleteAvatar($call, await $request);
  }

  $async.Future<$0.ResponseDto> deleteAvatar(
      $grpc.ServiceCall call, $0.FileDto request);

  $async.Stream<$0.FileDto> fetchAvatar_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.FileDto> $request) async* {
    yield* fetchAvatar($call, await $request);
  }

  $async.Stream<$0.FileDto> fetchAvatar(
      $grpc.ServiceCall call, $0.FileDto request);
}
