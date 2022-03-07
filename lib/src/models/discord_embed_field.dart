class DiscordEmbedField {
  /// name of the field
  final String name;

  /// value of the field
  final String value;

  /// whether or not this field should display inline
  ///
  /// is not always returned, hence the nullable property
  final bool? inline;

  static const nameEntry = 'name';
  static const valueEntry = 'value';
  static const inlineEntry = 'inline';

  DiscordEmbedField({
    required this.name,
    required this.value,
    this.inline,
  });

  factory DiscordEmbedField.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedField(
        name: json[nameEntry] as String,
        value: json[valueEntry] as String,
        inline: json[inlineEntry] as bool?,
      );
}
