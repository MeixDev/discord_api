class DiscordEmbedVideo {
  /// source url of video
  final String url;

  /// a proxied url of the video
  ///
  /// is not always returned, hence the nullable property
  final String? proxyUrl;

  /// height of the video
  ///
  /// is not always returned, hence the nullable property
  final int? height;

  /// width of the video
  ///
  /// is not always returned, hence the nullable property
  final int? width;

  static const urlEntry = 'url';
  static const proxyUrlEntry = 'proxy_url';
  static const heightEntry = 'height';
  static const widthEntry = 'width';

  DiscordEmbedVideo({
    required this.url,
    this.proxyUrl,
    this.height,
    this.width,
  });

  factory DiscordEmbedVideo.fromJson(Map<String, dynamic> json) =>
      DiscordEmbedVideo(
        url: json[urlEntry] as String,
        proxyUrl: json[proxyUrlEntry] as String?,
        height: json[heightEntry] as int?,
        width: json[widthEntry] as int?,
      );
}
