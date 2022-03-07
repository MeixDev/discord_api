class DiscordEmbedProvider {
  /// name of provider
  ///
  /// is not always returned, hence the nullable property
  final String? name;

  /// url of provider
  ///
  /// is not always returned, hence the nullable property
  final String? url;

  static const nameEntry = 'name';
  static const urlEntry = 'url';

  DiscordEmbedProvider({
    this.name,
    this.url,
  });

  factory DiscordEmbedProvider.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedProvider(
        name: json[nameEntry] as String?,
        url: json[urlEntry] as String?,
      );
}
