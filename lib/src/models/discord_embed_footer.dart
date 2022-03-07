class DiscordEmbedFooter {
  /// footer text
  final String text;

  /// url of footer icon (only supports http(s) and attachments)
  ///
  /// is not always returned, hence the nullable property
  final String? iconUrl;

  /// a proxied url of footer icon
  ///
  /// is not always returned, hence the nullable property
  final String? proxyIconUrl;

  static const textEntry = 'text';
  static const iconUrlEntry = 'icon_url';
  static const proxyIconUrlEntry = 'proxy_icon_url';

  DiscordEmbedFooter({
    required this.text,
    this.iconUrl,
    this.proxyIconUrl,
  });

  factory DiscordEmbedFooter.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedFooter(
        text: json[textEntry] as String,
        iconUrl: json[iconUrlEntry] as String?,
        proxyIconUrl: json[proxyIconUrlEntry] as String?,
      );
}
