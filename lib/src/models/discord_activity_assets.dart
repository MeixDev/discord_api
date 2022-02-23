class DiscordActivityAssets {
  /// see [Activity Asset Image](https://discord.com/developers/docs/topics/gateway#activity-object-activity-asset-image)
  ///
  /// is not always returned, hence the nullable property
  final String? largeImage;

  /// text displayed when hovering over the large image of the activity
  ///
  /// is not always returned, hence the nullable property
  final String? largeText;

  /// see [Activity Asset Image](https://discord.com/developers/docs/topics/gateway#activity-object-activity-asset-image)
  ///
  /// is not always returned, hence the nullable property
  final String? smallImage;

  /// text displayed when hovering over the small image of the activity
  ///
  /// is not always returned, hence the nullable property
  final String? smallText;

  static const largeImageEntry = 'large_image';
  static const largeTextEntry = 'large_text';
  static const smallImageEntry = 'small_image';
  static const smallTextEntry = 'small_text';

  DiscordActivityAssets({
    this.largeImage,
    this.largeText,
    this.smallImage,
    this.smallText,
  });

  factory DiscordActivityAssets.fromJson(Map<String, dynamic> json) =>
      DiscordActivityAssets(
        largeImage: json[largeImageEntry] as String?,
        largeText: json[largeTextEntry] as String?,
        smallImage: json[smallImageEntry] as String?,
        smallText: json[smallTextEntry] as String?,
      );
}
