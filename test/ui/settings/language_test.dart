import 'package:flutter_test/flutter_test.dart';
import 'package:leave_tracker/ui/settings/domain/entities/language.dart'; // Adjust the import as necessary

void main() {
  group('Language', () {
    test('Language instance is created correctly', () {
      // Create a Language instance
      const language = Language(title: 'English', code: 'en');

      // Verify the properties of the Language instance
      expect(language.title, 'English');
      expect(language.code, 'en');
    });

    test('Supported languages list contains expected languages', () {
      // Verify the length of the languageList
      expect(languageList.length, 2);

      // Verify the first language
      expect(languageList[0].title, 'English');
      expect(languageList[0].code, 'en');

      // Verify the second language
      expect(languageList[1].title, 'German');
      expect(languageList[1].code, 'de');
    });
  });
}
