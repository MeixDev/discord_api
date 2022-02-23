enum DiscordSystemChannelFlag {
  /// 1 << 0
  ///
  /// Suppress member join notifications
  suppressJoinNotifications,

  /// 1 << 1
  ///
  /// Suppress server boost notifications
  suppressPremiumSubscriptions,

  /// 1 << 2
  ///
  /// Suppress server setup tips
  suppressGuildReminderNotifications,

  /// 1 << 3
  ///
  /// Hide member join sticker reply buttons
  suppressJoinNotificationReplies,
}
