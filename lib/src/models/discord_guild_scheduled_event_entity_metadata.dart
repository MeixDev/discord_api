class DiscordGuildScheduledEventEntityMetadata {
  /// location of the event (1-100 characters)
  ///
  /// [required](https://discord.com/developers/docs/resources/guild-scheduled-event#guild-scheduled-event-object-guild-scheduled-event-entity-metadata) for events with 'entity_type': EXTERNAL
  ///
  /// is not always returned, hence the nullable property
  final String? location;

  static const locationEntry = 'location';

  DiscordGuildScheduledEventEntityMetadata({
    this.location,
  });

  factory DiscordGuildScheduledEventEntityMetadata.fromJson(
    Map<String, dynamic> json,
  ) =>
      DiscordGuildScheduledEventEntityMetadata(
        location: json[locationEntry] as String?,
      );
}
