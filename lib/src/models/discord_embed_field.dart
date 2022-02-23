class DiscordEmbedField {
  final String name;
  final String value;
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
