// This is a generated file - do not edit.
//
// Generated from posts.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ListPostsDto extends $pb.GeneratedMessage {
  factory ListPostsDto({
    $core.Iterable<PostDto>? posts,
    $core.Iterable<LikedPostsDto>? likedPosts,
  }) {
    final result = create();
    if (posts != null) result.posts.addAll(posts);
    if (likedPosts != null) result.likedPosts.addAll(likedPosts);
    return result;
  }

  ListPostsDto._();

  factory ListPostsDto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListPostsDto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListPostsDto',
      createEmptyInstance: create)
    ..pPM<PostDto>(1, _omitFieldNames ? '' : 'posts',
        subBuilder: PostDto.create)
    ..pPM<LikedPostsDto>(2, _omitFieldNames ? '' : 'likedPosts',
        protoName: 'likedPosts', subBuilder: LikedPostsDto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPostsDto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPostsDto copyWith(void Function(ListPostsDto) updates) =>
      super.copyWith((message) => updates(message as ListPostsDto))
          as ListPostsDto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPostsDto create() => ListPostsDto._();
  @$core.override
  ListPostsDto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListPostsDto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListPostsDto>(create);
  static ListPostsDto? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PostDto> get posts => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<LikedPostsDto> get likedPosts => $_getList(1);
}

class ListCommentsDto extends $pb.GeneratedMessage {
  factory ListCommentsDto({
    $core.Iterable<CommentDto>? comments,
  }) {
    final result = create();
    if (comments != null) result.comments.addAll(comments);
    return result;
  }

  ListCommentsDto._();

  factory ListCommentsDto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListCommentsDto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCommentsDto',
      createEmptyInstance: create)
    ..pPM<CommentDto>(1, _omitFieldNames ? '' : 'comments',
        subBuilder: CommentDto.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCommentsDto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCommentsDto copyWith(void Function(ListCommentsDto) updates) =>
      super.copyWith((message) => updates(message as ListCommentsDto))
          as ListCommentsDto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCommentsDto create() => ListCommentsDto._();
  @$core.override
  ListCommentsDto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListCommentsDto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCommentsDto>(create);
  static ListCommentsDto? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CommentDto> get comments => $_getList(0);
}

class LikedPostsDto extends $pb.GeneratedMessage {
  factory LikedPostsDto({
    $core.String? postId,
  }) {
    final result = create();
    if (postId != null) result.postId = postId;
    return result;
  }

  LikedPostsDto._();

  factory LikedPostsDto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LikedPostsDto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LikedPostsDto',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'postId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LikedPostsDto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LikedPostsDto copyWith(void Function(LikedPostsDto) updates) =>
      super.copyWith((message) => updates(message as LikedPostsDto))
          as LikedPostsDto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikedPostsDto create() => LikedPostsDto._();
  @$core.override
  LikedPostsDto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LikedPostsDto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LikedPostsDto>(create);
  static LikedPostsDto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get postId => $_getSZ(0);
  @$pb.TagNumber(1)
  set postId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);
}

class PostDto extends $pb.GeneratedMessage {
  factory PostDto({
    $core.String? id,
    $core.String? authorId,
    $core.String? title,
    $core.String? description,
    $core.String? imagePath,
    $core.String? likes,
    $core.String? authorUsername,
    $core.bool? isConfirmed,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (authorId != null) result.authorId = authorId;
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (imagePath != null) result.imagePath = imagePath;
    if (likes != null) result.likes = likes;
    if (authorUsername != null) result.authorUsername = authorUsername;
    if (isConfirmed != null) result.isConfirmed = isConfirmed;
    return result;
  }

  PostDto._();

  factory PostDto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PostDto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PostDto',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'authorId')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOS(5, _omitFieldNames ? '' : 'imagePath')
    ..aOS(6, _omitFieldNames ? '' : 'likes')
    ..aOS(7, _omitFieldNames ? '' : 'authorUsername')
    ..aOB(8, _omitFieldNames ? '' : 'isConfirmed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PostDto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PostDto copyWith(void Function(PostDto) updates) =>
      super.copyWith((message) => updates(message as PostDto)) as PostDto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostDto create() => PostDto._();
  @$core.override
  PostDto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PostDto getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostDto>(create);
  static PostDto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get authorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set authorId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAuthorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthorId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get imagePath => $_getSZ(4);
  @$pb.TagNumber(5)
  set imagePath($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasImagePath() => $_has(4);
  @$pb.TagNumber(5)
  void clearImagePath() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get likes => $_getSZ(5);
  @$pb.TagNumber(6)
  set likes($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLikes() => $_has(5);
  @$pb.TagNumber(6)
  void clearLikes() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get authorUsername => $_getSZ(6);
  @$pb.TagNumber(7)
  set authorUsername($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAuthorUsername() => $_has(6);
  @$pb.TagNumber(7)
  void clearAuthorUsername() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isConfirmed => $_getBF(7);
  @$pb.TagNumber(8)
  set isConfirmed($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsConfirmed() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsConfirmed() => $_clearField(8);
}

class RequestDto extends $pb.GeneratedMessage {
  factory RequestDto() => create();

  RequestDto._();

  factory RequestDto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestDto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestDto',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDto copyWith(void Function(RequestDto) updates) =>
      super.copyWith((message) => updates(message as RequestDto)) as RequestDto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestDto create() => RequestDto._();
  @$core.override
  RequestDto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestDto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestDto>(create);
  static RequestDto? _defaultInstance;
}

class ResponseDto extends $pb.GeneratedMessage {
  factory ResponseDto({
    $core.String? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  ResponseDto._();

  factory ResponseDto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResponseDto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResponseDto',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResponseDto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResponseDto copyWith(void Function(ResponseDto) updates) =>
      super.copyWith((message) => updates(message as ResponseDto))
          as ResponseDto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResponseDto create() => ResponseDto._();
  @$core.override
  ResponseDto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResponseDto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResponseDto>(create);
  static ResponseDto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
}

class CommentDto extends $pb.GeneratedMessage {
  factory CommentDto({
    $core.String? id,
    $core.String? authorId,
    $core.String? postId,
    $core.String? message,
    $core.String? authorUsername,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (authorId != null) result.authorId = authorId;
    if (postId != null) result.postId = postId;
    if (message != null) result.message = message;
    if (authorUsername != null) result.authorUsername = authorUsername;
    return result;
  }

  CommentDto._();

  factory CommentDto.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CommentDto.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CommentDto',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'authorId')
    ..aOS(3, _omitFieldNames ? '' : 'postId')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..aOS(5, _omitFieldNames ? '' : 'authorUsername')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommentDto clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CommentDto copyWith(void Function(CommentDto) updates) =>
      super.copyWith((message) => updates(message as CommentDto)) as CommentDto;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommentDto create() => CommentDto._();
  @$core.override
  CommentDto createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CommentDto getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommentDto>(create);
  static CommentDto? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get authorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set authorId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAuthorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthorId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get postId => $_getSZ(2);
  @$pb.TagNumber(3)
  set postId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPostId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPostId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get authorUsername => $_getSZ(4);
  @$pb.TagNumber(5)
  set authorUsername($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAuthorUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthorUsername() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
