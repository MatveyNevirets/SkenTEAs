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
  ],
};

/// Descriptor for `ListPostsDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPostsDtoDescriptor = $convert.base64Decode(
    'CgxMaXN0UG9zdHNEdG8SHgoFcG9zdHMYASADKAsyCC5Qb3N0RHRvUgVwb3N0cw==');

@$core.Deprecated('Use postDtoDescriptor instead')
const PostDto$json = {
  '1': 'PostDto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id'},
    {'1': 'author_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'authorId'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'image_path', '3': 5, '4': 1, '5': 9, '10': 'imagePath'},
    {'1': 'likes', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'likes'},
    {
      '1': 'comments',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.CommentDto',
      '10': 'comments'
    },
  ],
  '8': [
    {'1': 'id_optional'},
    {'1': 'likes_optional'},
  ],
};

/// Descriptor for `PostDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDtoDescriptor = $convert.base64Decode(
    'CgdQb3N0RHRvEhAKAmlkGAEgASgJSABSAmlkEh0KCWF1dGhvcl9pZBgCIAEoCUgAUghhdXRob3'
    'JJZBIUCgV0aXRsZRgDIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YBCABKAlSC2Rlc2NyaXB0'
    'aW9uEh0KCmltYWdlX3BhdGgYBSABKAlSCWltYWdlUGF0aBIWCgVsaWtlcxgGIAEoCUgBUgVsaW'
    'tlcxInCghjb21tZW50cxgHIAMoCzILLkNvbW1lbnREdG9SCGNvbW1lbnRzQg0KC2lkX29wdGlv'
    'bmFsQhAKDmxpa2VzX29wdGlvbmFs');

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
    {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id'},
    {'1': 'author_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'authorId'},
    {'1': 'post_id', '3': 3, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
  '8': [
    {'1': 'id_optional'},
  ],
};

/// Descriptor for `CommentDto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentDtoDescriptor = $convert.base64Decode(
    'CgpDb21tZW50RHRvEhAKAmlkGAEgASgJSABSAmlkEh0KCWF1dGhvcl9pZBgCIAEoCUgAUghhdX'
    'Rob3JJZBIXCgdwb3N0X2lkGAMgASgJUgZwb3N0SWQSGAoHbWVzc2FnZRgEIAEoCVIHbWVzc2Fn'
    'ZUINCgtpZF9vcHRpb25hbA==');
