import 'package:skenteas/core/posts/data/datasource/post_datasource.dart';
import 'package:skenteas/core/posts/data/models/comment.dart';
import 'package:skenteas/core/posts/data/models/post.dart';

class MockPostsDatasource implements PostsDatasource {
  final List<Post> _mockPosts = [
    Post(
      authorUsername: "Тема Карпов",
      title: "Почему ЧКП - best чайная Волгограда?",
      description:
          "Это очень простой вопрос. Все потому, что Матвей начал свой путь именно в этой чайной. Идите в лофт и вспоминаейте его легенадрную фразу: 'Пейте чай, друзья!'",
      imagePath: "assets/images/mock_image_0.png",
      likes: 124,
      comments: [
        Comment(
          id: 0,
          authorUsername: "Еропка",
          postId: 0,
          message: "Артем, когда в лофт приедешь?",
        ),
        Comment(
          id: 1,
          authorUsername: "Матви",
          postId: 1,
          message: "Тема, истину глаголишь!",
        ),
      ],
    ),
    Post(
      authorUsername: "Матви",
      title: "Как я в чайную попал",
      description:
          "Дело началось в Волгограде, когда мы в очередной раз приехали туда. Мне было нечего делать, я открыл гугл карты и начал искать самые разные места. Так я и наткнулся на чайную.",
      imagePath: "assets/images/mock_image_1.png",
      likes: 231,
      comments: [
        Comment(
          id: 3,
          authorUsername: "Тема Карпов",
          postId: 2,
          message: "О! Давай увидимся в чайной в марте?!",
        ),
        Comment(
          id: 4,
          authorUsername: "Тарас Пушка",
          postId: 3,
          message: "Да как же это отлично! Я с Темой в марте еду!",
        ),
      ],
    ),
  ];

  @override
  Future<List<Post>> getPosts() async {
    await Future.delayed(Duration(seconds: 2));

    return _mockPosts;
  }

  @override
  Future<void> insertPost(Post post) async {
    await Future.delayed(Duration(seconds: 2));
    _mockPosts.add(post);
  }
}
