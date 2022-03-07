class DiscordEmbedAuthor {
  /// name of author
  final String name;

  /// url of author
  ///
  /// is not always returned, hence the nullable property
  final String? url;

  /// url of author icon (only supports http(s) and attachments)
  ///
  /// is not always returned, hence the nullable property
  final String? iconUrl;

  /// a proxied url of author icon
  ///
  /// is not always returned, hence the nullable property
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
