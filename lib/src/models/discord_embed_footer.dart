class DiscordEmbedFooter {
  final String? text;
  final String? iconUrl;
  final String? proxyIconUrl;

  static const textEntry = 'text';
  static const iconUrlEntry = 'icon_url';
  static const proxyIconUrlEntry = 'proxy_icon_url';

  DiscordEmbedFooter({
    this.text,
    this.iconUrl,
    this.proxyIconUrl,
  });

  factory DiscordEmbedFooter.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedFooter(
        text: json[textEntry] as String?,
        iconUrl: json[iconUrlEntry] as String?,
        proxyIconUrl: json[proxyIconUrlEntry] as String?,
      );
}
