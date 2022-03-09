import 'discord_snowflake.dart';
import 'discord_sticker_format_type.dart';
import 'discord_sticker_type.dart';
import 'discord_user.dart';

/// Represents a sticker that can be sent in messages.
class DiscordSticker {
  /// [id of the sticker](https://discord.com/developers/docs/reference#image-formatting)
  final DiscordSnowflake id;

  /// for standard stickers, id of the pack the sticker is from
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? packId;

  /// name of the sticker
  final String name;

  /// description of the sticker
  ///
  /// can be null
  final String? description;

  /// autocomplete/suggestion tags for the sticker (max 200 characters)
  ///
  /// * A comma separated list of keywords is the format used in this
  /// field by standard stickers, but this is just a convention.
  /// Incidentally the client will always use a name generated from
  /// an emoji as the value of this field when creating or modifying
  /// a guild sticker.
  final String tags;

  /// **Deprecated** previously the sticker asset hash, now an empty string
  final String asset;

  /// [type of sticker](https://discord.com/developers/docs/resources/sticker#sticker-object-sticker-types)
  final int type;

  late final DiscordStickerType? _typeAsEnum;

  /// [type of sticker format](https://discord.com/developers/docs/resources/sticker#sticker-object-sticker-format-types)
  final int formatType;

  late final DiscordStickerFormatType? _formatTypeAsEnum;

  /// whether this guild sticker can be used, may be false due to loss of Server Boosts
  ///
  /// is not always returned, hence the nullable property
  final bool? available;

  /// id of the guild that owns this sticker
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? guildId;

  /// the user that uploaded this guild sticker*
  ///
  /// is not always returned, hence the nullable property
  final DiscordUser? user;

  /// the standard sticker's sort order within its pack
  ///
  /// is not always returned, hence the nullable property
  final int? sortValue;

  static const idEntry = 'id';
  static const packIdEntry = 'pack_id';
  static const nameEntry = 'name';
  static const descriptionEntry = 'description';
  static const tagsEntry = 'tags';
  static const assetEntry = 'asset';
  static const typeEntry = 'type';
  static const formatTypeEntry = 'format_type';
  static const availableEntry = 'available';
  static const guildIdEntry = 'guild_id';
  static const userEntry = 'user';
  static const sortValueEntry = 'sort_value';

  DiscordSticker({
    required this.id,
    this.packId,
    required this.name,
    this.description,
    required this.tags,
    required this.asset,
    required this.type,
    required this.formatType,
    this.available,
    this.guildId,
    this.user,
    this.sortValue,
  });

  DiscordStickerType get typeAsEnum {
    _typeAsEnum ??= DiscordStickerType.values[type];
    return _typeAsEnum!;
  }

  DiscordStickerFormatType get formatTypeAsEnum {
    _formatTypeAsEnum ??= DiscordStickerFormatType.values[formatType];
    return _formatTypeAsEnum!;
  }

  factory DiscordSticker.fromJson(Map<String, dynamic> json) => DiscordSticker(
        id: DiscordSnowflake(json[idEntry] as String),
        packId: json[packIdEntry] != null
            ? DiscordSnowflake(json[packIdEntry] as String)
            : null,
        name: json[nameEntry] as String,
        description: json[descriptionEntry] as String?,
        tags: json[tagsEntry] as String,
        asset: json[assetEntry] as String,
        type: json[typeEntry] as int,
        formatType: json[formatTypeEntry] as int,
        available:
            json[availableEntry] != null ? json[availableEntry] as bool? : null,
        guildId: json[guildIdEntry] != null
            ? DiscordSnowflake(json[guildIdEntry] as String)
            : null,
        user: json[userEntry] != null
            ? DiscordUser.fromJson(json[userEntry] as Map<String, dynamic>)
            : null,
        sortValue: json[sortValueEntry] as int?,
      );
}
