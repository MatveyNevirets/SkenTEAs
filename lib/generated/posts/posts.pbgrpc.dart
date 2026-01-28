// This is a generated file - do not edit.
//
// Generated from posts.proto.

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

import 'posts.pb.dart' as $0;

export 'posts.pb.dart';

@$pb.GrpcServiceName('PostsRpc')
class PostsRpcClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PostsRpcClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.ResponseDto> insertPost(
    $0.PostDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$insertPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseDto> deletePost(
    $0.PostDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deletePost, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListPostsDto> fetchUserPosts(
    $0.ResponseDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fetchUserPosts, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListPostsDto> fetchPosts(
    $0.ResponseDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fetchPosts, request, options: options);
  }

  $grpc.ResponseFuture<$0.PostDto> fetchPostDetails(
    $0.PostDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fetchPostDetails, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseDto> commentPost(
    $0.CommentDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$commentPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListCommentsDto> fetchPostComments(
    $0.PostDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fetchPostComments, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseDto> likePost(
    $0.PostDto request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$likePost, request, options: options);
  }

  // method descriptors

  static final _$insertPost = $grpc.ClientMethod<$0.PostDto, $0.ResponseDto>(
      '/PostsRpc/InsertPost',
      ($0.PostDto value) => value.writeToBuffer(),
      $0.ResponseDto.fromBuffer);
  static final _$deletePost = $grpc.ClientMethod<$0.PostDto, $0.ResponseDto>(
      '/PostsRpc/DeletePost',
      ($0.PostDto value) => value.writeToBuffer(),
      $0.ResponseDto.fromBuffer);
  static final _$fetchUserPosts =
      $grpc.ClientMethod<$0.ResponseDto, $0.ListPostsDto>(
          '/PostsRpc/FetchUserPosts',
          ($0.ResponseDto value) => value.writeToBuffer(),
          $0.ListPostsDto.fromBuffer);
  static final _$fetchPosts =
      $grpc.ClientMethod<$0.ResponseDto, $0.ListPostsDto>(
          '/PostsRpc/FetchPosts',
          ($0.ResponseDto value) => value.writeToBuffer(),
          $0.ListPostsDto.fromBuffer);
  static final _$fetchPostDetails = $grpc.ClientMethod<$0.PostDto, $0.PostDto>(
      '/PostsRpc/FetchPostDetails',
      ($0.PostDto value) => value.writeToBuffer(),
      $0.PostDto.fromBuffer);
  static final _$commentPost =
      $grpc.ClientMethod<$0.CommentDto, $0.ResponseDto>(
          '/PostsRpc/CommentPost',
          ($0.CommentDto value) => value.writeToBuffer(),
          $0.ResponseDto.fromBuffer);
  static final _$fetchPostComments =
      $grpc.ClientMethod<$0.PostDto, $0.ListCommentsDto>(
          '/PostsRpc/FetchPostComments',
          ($0.PostDto value) => value.writeToBuffer(),
          $0.ListCommentsDto.fromBuffer);
  static final _$likePost = $grpc.ClientMethod<$0.PostDto, $0.ResponseDto>(
      '/PostsRpc/LikePost',
      ($0.PostDto value) => value.writeToBuffer(),
      $0.ResponseDto.fromBuffer);
}

@$pb.GrpcServiceName('PostsRpc')
abstract class PostsRpcServiceBase extends $grpc.Service {
  $core.String get $name => 'PostsRpc';

  PostsRpcServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PostDto, $0.ResponseDto>(
        'InsertPost',
        insertPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PostDto.fromBuffer(value),
        ($0.ResponseDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PostDto, $0.ResponseDto>(
        'DeletePost',
        deletePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PostDto.fromBuffer(value),
        ($0.ResponseDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResponseDto, $0.ListPostsDto>(
        'FetchUserPosts',
        fetchUserPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ResponseDto.fromBuffer(value),
        ($0.ListPostsDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResponseDto, $0.ListPostsDto>(
        'FetchPosts',
        fetchPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ResponseDto.fromBuffer(value),
        ($0.ListPostsDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PostDto, $0.PostDto>(
        'FetchPostDetails',
        fetchPostDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PostDto.fromBuffer(value),
        ($0.PostDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CommentDto, $0.ResponseDto>(
        'CommentPost',
        commentPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CommentDto.fromBuffer(value),
        ($0.ResponseDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PostDto, $0.ListCommentsDto>(
        'FetchPostComments',
        fetchPostComments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PostDto.fromBuffer(value),
        ($0.ListCommentsDto value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PostDto, $0.ResponseDto>(
        'LikePost',
        likePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PostDto.fromBuffer(value),
        ($0.ResponseDto value) => value.writeToBuffer()));
  }

  $async.Future<$0.ResponseDto> insertPost_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PostDto> $request) async {
    return insertPost($call, await $request);
  }

  $async.Future<$0.ResponseDto> insertPost(
      $grpc.ServiceCall call, $0.PostDto request);

  $async.Future<$0.ResponseDto> deletePost_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PostDto> $request) async {
    return deletePost($call, await $request);
  }

  $async.Future<$0.ResponseDto> deletePost(
      $grpc.ServiceCall call, $0.PostDto request);

  $async.Future<$0.ListPostsDto> fetchUserPosts_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.ResponseDto> $request) async {
    return fetchUserPosts($call, await $request);
  }

  $async.Future<$0.ListPostsDto> fetchUserPosts(
      $grpc.ServiceCall call, $0.ResponseDto request);

  $async.Future<$0.ListPostsDto> fetchPosts_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.ResponseDto> $request) async {
    return fetchPosts($call, await $request);
  }

  $async.Future<$0.ListPostsDto> fetchPosts(
      $grpc.ServiceCall call, $0.ResponseDto request);

  $async.Future<$0.PostDto> fetchPostDetails_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PostDto> $request) async {
    return fetchPostDetails($call, await $request);
  }

  $async.Future<$0.PostDto> fetchPostDetails(
      $grpc.ServiceCall call, $0.PostDto request);

  $async.Future<$0.ResponseDto> commentPost_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.CommentDto> $request) async {
    return commentPost($call, await $request);
  }

  $async.Future<$0.ResponseDto> commentPost(
      $grpc.ServiceCall call, $0.CommentDto request);

  $async.Future<$0.ListCommentsDto> fetchPostComments_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PostDto> $request) async {
    return fetchPostComments($call, await $request);
  }

  $async.Future<$0.ListCommentsDto> fetchPostComments(
      $grpc.ServiceCall call, $0.PostDto request);

  $async.Future<$0.ResponseDto> likePost_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PostDto> $request) async {
    return likePost($call, await $request);
  }

  $async.Future<$0.ResponseDto> likePost(
      $grpc.ServiceCall call, $0.PostDto request);
}
