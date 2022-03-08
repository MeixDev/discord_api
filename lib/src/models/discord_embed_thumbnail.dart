class DiscordEmbedThumbnail {
  /// source url of thumbnail (only supports http(s) and attachments)
  final String url;

  /// a proxied url of the thumbnail
  ///
  /// is not always returned, hence the nullable property
  final String? proxyUrl;

  /// height of the thumbnail
  ///
  /// is not always returned, hence the nullable property
  final int? height;

  /// width of the thumbnail
  ///
  /// is not always returned, hence the nullable property
  final int? width;

  static const urlEntry = 'url';
  static const proxyUrlEntry = 'proxy_url';
  static const heightEntry = 'height';
  static const widthEntry = 'width';

  DiscordEmbedThumbnail({
    required this.url,
    this.proxyUrl,
    this.height,
    this.width,
  });

  factory DiscordEmbedThumbnail.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedThumbnail(
        url: json[urlEntry] as String,
        proxyUrl: json[proxyUrlEntry] as String?,
        height: json[heightEntry] as int?,
        width: json[widthEntry] as int?,
      );
}
