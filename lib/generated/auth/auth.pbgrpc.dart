// This is a generated file - do not edit.
//
// Generated from auth.proto.

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

import 'auth.pb.dart' as $0;

export 'auth.pb.dart';

@$pb.GrpcServiceName('AuthRpc')
class AuthRpcClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AuthRpcClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.TokensDto> signIn(
    $0.UserDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$signIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokensDto> signUp(
    $0.UserDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokensDto> refreshTokens(
    $0.TokensDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$refreshTokens, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserDto> fetchUser(
    $0.RequestDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fetchUser, request, options: options);
  }

  // method descriptors

  static final _$signIn = $grpc.ClientMethod<$0.UserDto, $0.TokensDto>(
      '/AuthRpc/SignIn',
      ($0.UserDto value) => value.writeToBuffer(),
      $0.TokensDto.fromBuffer);
  static final _$signUp = $grpc.ClientMethod<$0.UserDto, $0.TokensDto>(
      '/AuthRpc/SignUp',
      ($0.UserDto value) => value.writeToBuffer(),
      $0.TokensDto.fromBuffer);
  static final _$refreshTokens = $grpc.ClientMethod<$0.TokensDto, $0.TokensDto>(
      '/AuthRpc/RefreshTokens',
      ($0.TokensDto value) => value.writeToBuffer(),
      $0.TokensDto.fromBuffer);
  static final _$fetchUser = $grpc.ClientMethod<$0.RequestDto, $0.UserDto>(
      '/AuthRpc/FetchUser',
      ($0.RequestDto value) => value.writeToBuffer(),
      $0.UserDto.fromBuffer);
}

@$pb.GrpcServiceName('AuthRpc')
abstract class AuthRpcServiceBase extends $grpc.Service {
  $core.String get $name => 'AuthRpc';

  AuthRpcServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserDto, $0.TokensDto>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserDto.fromBuffer(value),
        ($0.TokensDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserDto, $0.TokensDto>(
        'SignUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserDto.fromBuffer(value),
        ($0.TokensDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TokensDto, $0.TokensDto>(
        'RefreshTokens',
        refreshTokens_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TokensDto.fromBuffer(value),
        ($0.TokensDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestDto, $0.UserDto>(
        'FetchUser',
        fetchUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RequestDto.fromBuffer(value),
        ($0.UserDto value) => value.writeToBuffer()));
  }

  $async.Future<$0.TokensDto> signIn_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.UserDto> $request) async {
    return signIn($call, await $request);
  }

  $async.Future<$0.TokensDto> signIn(
      $grpc.ServiceCall call, $0.UserDto request);

  $async.Future<$0.TokensDto> signUp_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.UserDto> $request) async {
    return signUp($call, await $request);
  }

  $async.Future<$0.TokensDto> signUp(
      $grpc.ServiceCall call, $0.UserDto request);

  $async.Future<$0.TokensDto> refreshTokens_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.TokensDto> $request) async {
    return refreshTokens($call, await $request);
  }

  $async.Future<$0.TokensDto> refreshTokens(
      $grpc.ServiceCall call, $0.TokensDto request);

  $async.Future<$0.UserDto> fetchUser_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.RequestDto> $request) async {
    return fetchUser($call, await $request);
  }

  $async.Future<$0.UserDto> fetchUser(
      $grpc.ServiceCall call, $0.RequestDto request);
}
