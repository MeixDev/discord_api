class DiscordEmbedProvider {
  final String? name;
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
