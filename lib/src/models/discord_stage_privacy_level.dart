enum DiscordStagePrivacyLevel {
  unused,

  /// The stage instance is visible publicly. (deprecated)
  @Deprecated("Stages can't be publicly visible anymore")
  public,

  /// The stage instance is visible to only guild members.
  guildOnly,
}
