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

  $grpc.ResponseFuture<$0.ResponseDto> putFile(
    $0.FileDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$putFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseDto> deleteFile(
    $0.FileDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteFile, request, options: options);
  }

  $grpc.ResponseStream<$0.FileDto> fetchFile(
    $0.FileDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$fetchFile, $async.Stream.fromIterable([request]),
        options: options);
  }

  // method descriptors

  static final _$putFile = $grpc.ClientMethod<$0.FileDto, $0.ResponseDto>(
      '/FilesRpc/PutFile',
      ($0.FileDto value) => value.writeToBuffer(),
      $0.ResponseDto.fromBuffer);
  static final _$deleteFile = $grpc.ClientMethod<$0.FileDto, $0.ResponseDto>(
      '/FilesRpc/DeleteFile',
      ($0.FileDto value) => value.writeToBuffer(),
      $0.ResponseDto.fromBuffer);
  static final _$fetchFile = $grpc.ClientMethod<$0.FileDto, $0.FileDto>(
      '/FilesRpc/FetchFile',
      ($0.FileDto value) => value.writeToBuffer(),
      $0.FileDto.fromBuffer);
}

@$pb.GrpcServiceName('FilesRpc')
abstract class FilesRpcServiceBase extends $grpc.Service {
  $core.String get $name => 'FilesRpc';

  FilesRpcServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FileDto, $0.ResponseDto>(
        'PutFile',
        putFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FileDto.fromBuffer(value),
        ($0.ResponseDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FileDto, $0.ResponseDto>(
        'DeleteFile',
        deleteFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FileDto.fromBuffer(value),
        ($0.ResponseDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FileDto, $0.FileDto>(
        'FetchFile',
        fetchFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.FileDto.fromBuffer(value),
        ($0.FileDto value) => value.writeToBuffer()));
  }

  $async.Future<$0.ResponseDto> putFile_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.FileDto> $request) async {
    return putFile($call, await $request);
  }

  $async.Future<$0.ResponseDto> putFile(
      $grpc.ServiceCall call, $0.FileDto request);

  $async.Future<$0.ResponseDto> deleteFile_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.FileDto> $request) async {
    return deleteFile($call, await $request);
  }

  $async.Future<$0.ResponseDto> deleteFile(
      $grpc.ServiceCall call, $0.FileDto request);

  $async.Stream<$0.FileDto> fetchFile_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.FileDto> $request) async* {
    yield* fetchFile($call, await $request);
  }

  $async.Stream<$0.FileDto> fetchFile(
      $grpc.ServiceCall call, $0.FileDto request);
}
