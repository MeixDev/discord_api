enum DiscordVerificationLevel {
  /// unrestricted
  none,

  /// must have verified email on account
  low,

  /// must be registered on Discord for longer than 5 minutes
  medium,

  /// must be a member of the server for longer than 10 minutes
  high,

  /// must have a verified phone number
  veryHigh,
}
