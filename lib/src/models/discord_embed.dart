import 'discord_embed_author.dart';
import 'discord_embed_field.dart';
import 'discord_embed_footer.dart';
import 'discord_embed_image.dart';
import 'discord_embed_provider.dart';
import 'discord_embed_thumbnail.dart';
import 'discord_embed_video.dart';

class DiscordEmbed {
  /// title of embed
  final String? title;

  /// [type of embed](https://discord.com/developers/docs/resources/channel#embed-object-embed-types)
  /// (always "rich" for webhook embeds)
  final String? type;

  /// description of embed
  final String? description;

  /// url of embed
  final String? url;

  /// timestamp of embed content
  final String? timestamp;

  late final DateTime? _timestampAsDateTime;

  /// color code of the embed
  final int? color;

  /// footer information
  final DiscordEmbedFooter? footer;

  /// image information
  final DiscordEmbedImage? image;

  /// thumbnail information
  final DiscordEmbedThumbnail? thumbnail;

  /// video information
  final DiscordEmbedVideo? video;

  /// provider information
  final DiscordEmbedProvider? provider;

  /// author information
  final DiscordEmbedAuthor? author;

  /// fields information
  final List<DiscordEmbedField>? fields;

  static const titleEntry = 'title';
  static const typeEntry = 'type';
  static const descriptionEntry = 'description';
  static const urlEntry = 'url';
  static const timestampEntry = 'timestamp';
  static const colorEntry = 'color';
  static const footerEntry = 'footer';
  static const imageEntry = 'image';
  static const thumbnailEntry = 'thumbnail';
  static const videoEntry = 'video';
  static const providerEntry = 'provider';
  static const authorEntry = 'author';
  static const fieldsEntry = 'fields';

  DiscordEmbed({
    this.title,
    this.type,
    this.description,
    this.url,
    this.timestamp,
    this.color,
    this.footer,
    this.image,
    this.thumbnail,
    this.video,
    this.provider,
    this.author,
    this.fields,
  });

  DateTime? get timestampAsDateTime {
    if (_timestampAsDateTime == null) {
      if (timestamp == null) {
        return null;
      }
      _timestampAsDateTime = DateTime.parse(timestamp!);
    }
    return _timestampAsDateTime;
  }

  factory DiscordEmbed.fromJson(Map<String, dynamic> json) => DiscordEmbed(
        title: json[titleEntry] as String?,
        type: json[typeEntry] as String?,
        description: json[descriptionEntry] as String?,
        url: json[urlEntry] as String?,
        timestamp: json[timestampEntry] as String?,
        color: json[colorEntry] as int?,
        footer: json[footerEntry] != null
            ? DiscordEmbedFooter.fromJson(
                json[footerEntry] as Map<String, dynamic>)
            : null,
        image: json[imageEntry] != null
            ? DiscordEmbedImage.fromJson(
                json[imageEntry] as Map<String, dynamic>)
            : null,
        thumbnail: json[thumbnailEntry] != null
            ? DiscordEmbedThumbnail.fromJson(
                json[thumbnailEntry] as Map<String, dynamic>)
            : null,
        video: json[videoEntry] != null
            ? DiscordEmbedVideo.fromJson(
                json[videoEntry] as Map<String, dynamic>)
            : null,
        provider: json[providerEntry] != null
            ? DiscordEmbedProvider.fromJson(
                json[providerEntry] as Map<String, dynamic>)
            : null,
        author: json[authorEntry] != null
            ? DiscordEmbedAuthor.fromJson(
                json[authorEntry] as Map<String, dynamic>)
            : null,
        fields: json[fieldsEntry] != null
            ? List<DiscordEmbedField>.from(
                json[fieldsEntry]!.map(DiscordEmbedField.fromJson))
            : null,
      );
  //(json[fieldsEntry] as List<dynamic>)?.map((e) => DiscordEmbedField.fromJson(e as Map<String, dynamic>))?.toList()
}
