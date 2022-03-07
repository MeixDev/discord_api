import 'discord_snowflake.dart';

// TODO: Add Documentation
class DiscordAttachment {
  final DiscordSnowflake id;
  final String filename;
  final String? description;
  final String? contentType;
  final int size;
  final String url;
  final String proxyUrl;
  final int? height;
  final int? width;
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
