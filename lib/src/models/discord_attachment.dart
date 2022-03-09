import 'discord_snowflake.dart';

class DiscordAttachment {
  /// attachment id
  final DiscordSnowflake id;

  /// name of file attached
  final String filename;

  /// description for the file
  final String? description;

  /// the attachment's [media type](https://en.wikipedia.org/wiki/Media_type)
  final String? contentType;

  /// size of file in bytes
  final int size;

  /// source url of file
  final String url;

  /// a proxied url of file
  final String proxyUrl;

  /// height of file (if image)
  final int? height;

  /// width of file (if image)
  final int? width;

  /// whether this attachment is ephemeral
  final bool? ephemeral;

  static const idEntry = 'id';
  static const filenameEntry = 'filename';
  static const descriptionEntry = 'description';
  static const contentTypeEntry = 'content_type';
  static const sizeEntry = 'size';
  static const urlEntry = 'url';
  static const proxyUrlEntry = 'proxy_url';
  static const heightEntry = 'height';
  static const widthEntry = 'width';
  static const ephemeralEntry = 'ephemeral';

  DiscordAttachment({
    required this.id,
    required this.filename,
    this.description,
    this.contentType,
    required this.size,
    required this.url,
    required this.proxyUrl,
    this.height,
    this.width,
    this.ephemeral,
  });

  factory DiscordAttachment.fromJson(Map<String, dynamic> json) =>
      DiscordAttachment(
        id: DiscordSnowflake(json[idEntry] as String),
        filename: json[filenameEntry] as String,
        description: json[descriptionEntry] as String?,
        contentType: json[contentTypeEntry] as String?,
        size: json[sizeEntry] as int,
        url: json[urlEntry] as String,
        proxyUrl: json[proxyUrlEntry] as String,
        height: json[heightEntry] as int?,
        width: json[widthEntry] as int?,
        ephemeral: json[ephemeralEntry] as bool?,
      );
}
