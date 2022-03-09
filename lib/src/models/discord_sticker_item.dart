import 'discord_snowflake.dart';
import 'discord_sticker_format_type.dart';

/// The smallest amount of data required to render a sticker.
/// A partial sticker object.
class DiscordStickerItem {
  /// id of the sticker
  final DiscordSnowflake id;

  /// name of the sticker
  final String name;

  /// [type of sticker format](https://discord.com/developers/docs/resources/sticker#sticker-object-sticker-format-types)
  final int formatType;

  late final DiscordStickerFormatType? _formatTypeAsEnum;

  static const idEntry = 'id';
  static const nameEntry = 'name';
  static const formatTypeEntry = 'format_type';

  DiscordStickerItem({
    required this.id,
    required this.name,
    required this.formatType,
  });

  DiscordStickerFormatType get formatTypeAsEnum {
    _formatTypeAsEnum ??= DiscordStickerFormatType.values[formatType];
    return _formatTypeAsEnum!;
  }

  factory DiscordStickerItem.fromJson(Map<String, dynamic> json) =>
      DiscordStickerItem(
        id: DiscordSnowflake(json[idEntry] as String),
        name: json[nameEntry] as String,
        formatType: json[formatTypeEntry] as int,
      );
}
