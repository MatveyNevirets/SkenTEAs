// This is a generated file - do not edit.
//
// Generated from posts.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listPostsDtoDescriptor instead')
const ListPostsDto$json = {
  '1': 'ListPostsDto',
  '2': [
    {'1': 'posts', '3': 1, '4': 3, '5': 11, '6': '.PostDto', '10': 'posts'},
    {
      '1': 'likedPosts',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.LikedPostsDto',
      '10': 'likedPosts'
    },
  ],
};

/// Descriptor for `ListPostsDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPostsDtoDescriptor = $convert.base64Decode(
    'CgxMaXN0UG9zdHNEdG8SHgoFcG9zdHMYASADKAsyCC5Qb3N0RHRvUgVwb3N0cxIuCgpsaWtlZF'
    'Bvc3RzGAIgAygLMg4uTGlrZWRQb3N0c0R0b1IKbGlrZWRQb3N0cw==');

@$core.Deprecated('Use listCommentsDtoDescriptor instead')
const ListCommentsDto$json = {
  '1': 'ListCommentsDto',
  '2': [
    {
      '1': 'comments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.CommentDto',
      '10': 'comments'
    },
  ],
};

/// Descriptor for `ListCommentsDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCommentsDtoDescriptor = $convert.base64Decode(
    'Cg9MaXN0Q29tbWVudHNEdG8SJwoIY29tbWVudHMYASADKAsyCy5Db21tZW50RHRvUghjb21tZW'
    '50cw==');

@$core.Deprecated('Use likedPostsDtoDescriptor instead')
const LikedPostsDto$json = {
  '1': 'LikedPostsDto',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 9, '10': 'postId'},
  ],
};

/// Descriptor for `LikedPostsDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likedPostsDtoDescriptor = $convert
    .base64Decode('Cg1MaWtlZFBvc3RzRHRvEhcKB3Bvc3RfaWQYASABKAlSBnBvc3RJZA==');

@$core.Deprecated('Use postDtoDescriptor instead')
const PostDto$json = {
  '1': 'PostDto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'author_id', '3': 2, '4': 1, '5': 9, '10': 'authorId'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'image_path', '3': 5, '4': 1, '5': 9, '10': 'imagePath'},
    {'1': 'likes', '3': 6, '4': 1, '5': 9, '10': 'likes'},
    {'1': 'author_username', '3': 7, '4': 1, '5': 9, '10': 'authorUsername'},
  ],
};

/// Descriptor for `PostDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDtoDescriptor = $convert.base64Decode(
    'CgdQb3N0RHRvEg4KAmlkGAEgASgJUgJpZBIbCglhdXRob3JfaWQYAiABKAlSCGF1dGhvcklkEh'
    'QKBXRpdGxlGAMgASgJUgV0aXRsZRIgCgtkZXNjcmlwdGlvbhgEIAEoCVILZGVzY3JpcHRpb24S'
    'HQoKaW1hZ2VfcGF0aBgFIAEoCVIJaW1hZ2VQYXRoEhQKBWxpa2VzGAYgASgJUgVsaWtlcxInCg'
    '9hdXRob3JfdXNlcm5hbWUYByABKAlSDmF1dGhvclVzZXJuYW1l');

@$core.Deprecated('Use requestDtoDescriptor instead')
const RequestDto$json = {
  '1': 'RequestDto',
};

/// Descriptor for `RequestDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDtoDescriptor =
    $convert.base64Decode('CgpSZXF1ZXN0RHRv');

@$core.Deprecated('Use responseDtoDescriptor instead')
const ResponseDto$json = {
  '1': 'ResponseDto',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ResponseDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDtoDescriptor = $convert
    .base64Decode('CgtSZXNwb25zZUR0bxIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use commentDtoDescriptor instead')
const CommentDto$json = {
  '1': 'CommentDto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'author_id', '3': 2, '4': 1, '5': 9, '10': 'authorId'},
    {'1': 'post_id', '3': 3, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    {'1': 'author_username', '3': 5, '4': 1, '5': 9, '10': 'authorUsername'},
  ],
};

/// Descriptor for `CommentDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentDtoDescriptor = $convert.base64Decode(
    'CgpDb21tZW50RHRvEg4KAmlkGAEgASgJUgJpZBIbCglhdXRob3JfaWQYAiABKAlSCGF1dGhvck'
    'lkEhcKB3Bvc3RfaWQYAyABKAlSBnBvc3RJZBIYCgdtZXNzYWdlGAQgASgJUgdtZXNzYWdlEicK'
    'D2F1dGhvcl91c2VybmFtZRgFIAEoCVIOYXV0aG9yVXNlcm5hbWU=');
