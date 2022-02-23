class DiscordEmbedImage {
  final String url;
  final String? proxyUrl;
  final int? height;
  final int? width;

  static const urlEntry = 'url';
  static const proxyUrlEntry = 'proxy_url';
  static const heightEntry = 'height';
  static const widthEntry = 'width';

  DiscordEmbedImage({
    required this.url,
    this.proxyUrl,
    this.height,
    this.width,
  });

  factory DiscordEmbedImage.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedImage(
        url: json[urlEntry] as String,
        proxyUrl: json[proxyUrlEntry] as String?,
        height: json[heightEntry] as int?,
        width: json[widthEntry] as int?,
      );
}
