/// Represents a language with its title and code.
class Language {
  /// The display name of the language (e.g., "English").
  final String title;

  /// The ISO code of the language (e.g., "en" for English).
  final String code;

  /// Creates a [Language] instance with a [title] and [code].
  const Language({
    required this.title,
    required this.code,
  });
}

/// List of supported languages
final languageList = [
  const Language(title: 'English', code: 'en'),
  const Language(title: 'German', code: 'de'),
];