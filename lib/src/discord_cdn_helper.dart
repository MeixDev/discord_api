import 'package:discord_api/src/models/discord_image_format.dart';

class DiscordCdnHelper {
  static final cndUrl = Uri(scheme: "https", host: "cdn.discordapp.com");

  /// Available formats : PNG, JPEG, WebP, GIF
  static final formatList1 = [
    DiscordImageFormat.png,
    DiscordImageFormat.jpeg,
    DiscordImageFormat.webp,
    DiscordImageFormat.gif,
  ];

  /// Available formats : PNG, JPEG, WebP
  static final formatList2 = [
    DiscordImageFormat.png,
    DiscordImageFormat.jpeg,
    DiscordImageFormat.webp,
  ];

  /// Available formats : PNG, Lottie
  static final formatList3 = [
    DiscordImageFormat.png,
    DiscordImageFormat.lottie,
  ];

  /// Checks whether or not the int x is a valid size for the Discord CDN query parameter `size`.
  ///
  /// The size is only valid if it's a power of 2,
  /// between 16 and 4096.
  bool isValidSize(int x) {
    return (x >= 16) && (x <= 4096) && ((x & (x - 1)) == 0);
  }

  /// Returns the CDN URL for a given path, as a String.
  ///
  /// Probably shouldn't be used, as specialized functions exists.
  String getString(String path) => getUrl(path).toString();

  /// Returns the CDN URL for a given path, as an URI.
  ///
  /// Probably shouldn't be used, as specialized functions exists.
  Uri getUrl(String path) => cndUrl.replace(pathSegments: path.split('/'));

  /// Tries to create the right URL slug for an emoji, given its emoji_id, in a given format
  /// (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getCustomEmoji({
    required String emojiId,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList1.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString('/emojis/$emojiId.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for a guild icon, given its guild_id and icon hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available, if the size is not valid,
  /// or if the format is GIF, and the hash doesn't begin with "a_".
  String? getGuildIcon({
    required String guildId,
    required String guildIconHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList1.contains(format) || !isValidSize(size)) {
      return null;
    }
    if (format == DiscordImageFormat.gif && !guildIconHash.startsWith('a_')) {
      return null;
    }
    return getString(
        '/icons/$guildId/$guildIconHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for a guild splash, given its guild_id and splash hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getGuildSplash({
    required String guildId,
    required String guildSplashHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/splashes/$guildId/$guildSplashHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for a guild discovery splash, given its guild_id and discovery splash hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getGuildDiscoverySplash({
    required String guildId,
    required String guildDiscoverySplashHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/discovery-splashes/$guildId/$guildDiscoverySplashHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for a guild banner, given its guild_id and banner hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getGuildBanner({
    required String guildId,
    required String guildBannerHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/banners/$guildId/$guildBannerHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for a user banner, given its user_id and banner hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available, if the size is not valid,
  /// or if the format is GIF, and the hash doesn't begin with "a_".
  String? getUserBanner({
    required String userId,
    required String userBannerHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList1.contains(format) || !isValidSize(size)) {
      return null;
    }
    if (format == DiscordImageFormat.gif && !userBannerHash.startsWith('a_')) {
      return null;
    }
    return getString(
        '/banners/$userId/$userBannerHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for the default user avatar of a user,
  /// given it's discriminator.
  ///
  /// This endpoint can only give back a PNG image, and ignores the size query parameter.
  String? getDefaultUserAvatar(String discriminator) {
    final discr = int.tryParse(discriminator);
    if (discr != null) {
      return getString('/embed/avatars/${discr % 5}.png');
    }
    return null;
  }

  /// Tries to create the right URL slug for a user avatar, given its user_id and avatar hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available, if the size is not valid,
  /// or if the format is GIF, and the hash doesn't begin with "a_".
  String? getUserAvatar({
    required String userId,
    required String userAvatarHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList1.contains(format) || !isValidSize(size)) {
      return null;
    }
    if (format == DiscordImageFormat.gif && !userAvatarHash.startsWith('a_')) {
      return null;
    }
    return getString(
        '/avatars/$userId/$userAvatarHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for a guild member avatar, given its guild_id, user_id
  /// and member avatar hash, in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available, if the size is not valid,
  /// or if the format is GIF, and the hash doesn't begin with "a_".
  String? getGuildMemberAvatar({
    required String guildId,
    required String userId,
    required String memberAvatarHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList1.contains(format) || !isValidSize(size)) {
      return null;
    }
    if (format == DiscordImageFormat.gif &&
        !memberAvatarHash.startsWith('a_')) {
      return null;
    }
    return getString(
        '/guilds/$guildId/users/$userId/avatars/$memberAvatarHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for an application icon, given its application_id and icon hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getApplicationIcon({
    required String applicationId,
    required String applicationIconHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/app-icons/$applicationId/$applicationIconHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for an application cover, given its application_id and cover image hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getApplicationCover({
    required String applicationId,
    required String applicationCoverHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/app-icons/$applicationId/$applicationCoverHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for an application asset, given its application_id and asset hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getApplicationAsset({
    required String applicationId,
    required String applicationAssetHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/app-assets/$applicationId/$applicationAssetHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for an application's achievement icon,
  /// given its application_id, achievement_id and icon hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getApplicationAchievementIcon({
    required String applicationId,
    required String achievementId,
    required String achievementIconHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/app-assets/$applicationId/achievements/$achievementId/icons/$achievementIconHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for a sticker pack banner, given its asset_id,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getStickerPackBanner({
    required String stickerPackBannerId,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/app-assets/710982414301790216/store/$stickerPackBannerId.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for a team icon, given its team_id and team icon hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getTeamIcon({
    required String teamId,
    required String teamIconHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/team-icons/$teamId/$teamIconHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for a sticker, given its sticker_id,
  /// in a given format (defaults to PNG).
  ///
  /// The size query parameter is ignored on this endpoint.
  ///
  /// **NOTE**: The sticker will be available as PNG if its `format_type` is `PNG` or `APNG`,
  /// and as [Lottie](https://airbnb.io/lottie/#/) if its `format_type`| is `LOTTIE`. This method
  /// cannot check for those values, so you should ensure which type you need beforehand.
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getSticker({
    required String stickerId,
    DiscordImageFormat format = DiscordImageFormat.png,
  }) {
    if (!formatList3.contains(format)) {
      return null;
    }
    return getString('/stickers/$stickerId.${format.fileExtension}');
  }

  /// Tries to create the right URL slug for a role icon, given its role_id and role icon hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getRoleIcon({
    required String roleId,
    required String roleIconHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/role-icons/$roleId/$roleIconHash.${format.fileExtension}?size=$size');
  }

  /// Tries to create the right URL slug for a guild scheduled event cover,
  /// given its scheduled_event_id and schedule event cover image hash,
  /// in a given format (defaults to PNG), with a given size (defaults to 128).
  ///
  /// Returns null if the format is not available or the size is not valid.
  String? getGuildScheduledEventCover({
    required String scheduledEventId,
    required String scheduledEventCoverHash,
    DiscordImageFormat format = DiscordImageFormat.png,
    int size = 128,
  }) {
    if (!formatList2.contains(format) || !isValidSize(size)) {
      return null;
    }
    return getString(
        '/guild-events/$scheduledEventId/$scheduledEventCoverHash.${format.fileExtension}?size=$size');
  }
}
