class DiscordEmbedThumbnail {
  final String url;
  final String? proxyUrl;
  final int? height;
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
