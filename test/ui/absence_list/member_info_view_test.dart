import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/generated/assets.dart';
import 'package:leave_tracker/ui/absence_list/presentation/widgets/member_info_view.dart';
import 'package:flutter/foundation.dart';

// Mock Image Loading
class TestNetworkImage extends ImageProvider<TestNetworkImage> {
  const TestNetworkImage();

  @override
  Future<TestNetworkImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<TestNetworkImage>(this);
  }

  @override
  ImageStreamCompleter load(TestNetworkImage key, decode) {
    return OneFrameImageStreamCompleter(
      Future<ImageInfo>.value(
        ImageInfo(image: _createTestImage(), scale: 1.0),
      ),
    );
  }

  Image _createTestImage() {
    return Image.asset(Assets.imagesDefaultImage).image;
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestNetworkImage;

  @override
  int get hashCode => runtimeType.hashCode;
}

void main() {
  group('MemberInfoView', () {
    testWidgets('displays member information with mocked network image', (WidgetTester tester) async {
      // Arrange
      const String testImageUrl = 'https://loremflickr.com/300/400';
      const String testName = 'John Doe';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MemberInfoView(
              image: testImageUrl,
              name: testName,
            ),
          ),
        ),
      );

      // Mock the image loading
      final CircleAvatar avatar = tester.widget(find.byType(CircleAvatar));
      await tester.runAsync(() {
        return avatar.backgroundImage!.resolve(ImageConfiguration()).addListener(
          ImageStreamListener((ImageInfo image, bool sync) {}),
        );
      });

      // Assert
      expect(find.text(testName), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('displays default image when image URL is empty', (WidgetTester tester) async {
      // Arrange
      const String testName = 'Jane Doe';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MemberInfoView(
              image: '',
              name: testName,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(testName), findsOneWidget);
      final CircleAvatar avatar = tester.widget(find.byType(CircleAvatar));
      expect(avatar.backgroundImage, isA<AssetImage>());
      expect((avatar.backgroundImage as AssetImage).assetName, Assets.imagesDefaultImage);
    });

    testWidgets('displays correct member name', (WidgetTester tester) async {
      // Arrange
      const String testName = 'Alice Doe';

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MemberInfoView(
              image: '',
              name: testName,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(testName), findsOneWidget);
    });
  });
}
