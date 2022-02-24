import 'package:discord_api/src/models/discord_sticker.dart';

import 'discord_snowflake.dart';

class DiscordStickerPack {
  /// id of the sticker pack
  final DiscordSnowflake id;

  /// the stickers in the pack
  final List<DiscordSticker> stickers;

  /// name of the sticker pack
  final String name;

  /// id of the pack's SKU
  final DiscordSnowflake skuId;

  /// id of a sticker in the pack which is shown as the pack's icon
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? coverStickerId;

  /// description of the sticker pack
  final String description;

  /// id of the sticker pack's [banner image](https://discord.com/developers/docs/reference#image-formatting)
  ///
  /// is not always returned, hence the nullable property
  final DiscordSnowflake? bannerAssetId;

  static const idEntry = 'id';
  static const stickersEntry = 'stickers';
  static const nameEntry = 'name';
  static const skuIdEntry = 'sku_id';
  static const coverStickerIdEntry = 'cover_sticker_id';
  static const descriptionEntry = 'description';
  static const bannerAssetIdEntry = 'banner_asset_id';

  DiscordStickerPack({
    required this.id,
    required this.stickers,
    required this.name,
    required this.skuId,
    this.coverStickerId,
    required this.description,
    this.bannerAssetId,
  });

  factory DiscordStickerPack.fromJson(Map<String, dynamic> json) =>
      DiscordStickerPack(
        id: DiscordSnowflake(json[idEntry] as String),
        stickers: List<DiscordSticker>.from(
            (json[stickersEntry]).map(DiscordSticker.fromJson)),
        name: json[nameEntry] as String,
        skuId: DiscordSnowflake(json[skuIdEntry] as String),
        coverStickerId: json[coverStickerIdEntry] != null
            ? DiscordSnowflake(json[coverStickerIdEntry] as String)
            : null,
        description: json[descriptionEntry] as String,
        bannerAssetId: json[bannerAssetIdEntry] != null
            ? DiscordSnowflake(json[bannerAssetIdEntry] as String)
            : null,
      );
}
