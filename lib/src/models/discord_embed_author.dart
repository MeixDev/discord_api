class DiscordEmbedAuthor {
  final String name;
  final String? url;
  final String? iconUrl;
  final String? proxyIconUrl;

  static const nameEntry = 'name';
  static const urlEntry = 'url';
  static const iconUrlEntry = 'icon_url';
  static const proxyIconUrlEntry = 'proxy_icon_url';

  DiscordEmbedAuthor({
    required this.name,
    this.url,
    this.iconUrl,
    this.proxyIconUrl,
  });

  factory DiscordEmbedAuthor.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedAuthor(
        name: json[nameEntry] as String,
        url: json[urlEntry] as String?,
        iconUrl: json[iconUrlEntry] as String?,
        proxyIconUrl: json[proxyIconUrlEntry] as String?,
      );
}
