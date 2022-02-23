class DiscordActivityButton {
  /// the text shown on the button (1-32 characters)
  final String label;

  /// the url opened when clicking the button (1-512 characters)
  final String url;

  static const labelEntry = 'label';
  static const urlEntry = 'url';

  DiscordActivityButton({
    required this.label,
    required this.url,
  });

  factory DiscordActivityButton.fromJson(Map<String, dynamic> json) =>
      DiscordActivityButton(
        label: json[labelEntry] as String,
        url: json[urlEntry] as String,
      );
}
