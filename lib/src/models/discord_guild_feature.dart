enum DiscordGuildFeature {
  /// guild has access to set an animated guild icon
  animatedIcon,

  /// guild has access to set a guild banner image
  banner,

  /// guild has access to use commerce features (i.e. create store channels)
  commerce,

  /// guild can enable welcome screen, Membership Screening, stage channels
  /// and discovery, and receives community updates
  community,

  /// guild is able to be discovered in the directory
  discoverable,

  /// guild is able to be featured in the directory
  featurable,

  /// guild has access to set an invite splash background
  inviteSplash,

  /// guild has enabled [Membership Screening](https://discord.com/developers/docs/resources/guild#membership-screening-object)
  memberVerificationGateEnable,

  /// guild has enabled monetization
  monetizationEnabled,

  /// guild has increased custom stickers slots
  moreStickers,

  /// guild has access to create news channels
  news,

  /// guild is partnered
  partnered,

  /// guild can be previwed before joining via Membership Screening or the directory
  previewEnabled,

  /// guild has access to create private threads
  privateThreads,

  /// guild is able to set role icons
  roleIcons,

  /// guild has access to the seven day archive time for threads
  sevenDayThreadArchive,

  /// guild has access to the three day archive time for threads
  threeDayThreadArchive,

  /// guild has enabled ticketed events
  ticketedEventsEnabled,

  /// guild has access to set a vanity URL
  vanityUrl,

  /// guild is verified
  verified,

  /// guild has access to set 384kbps bitrate in voice (previously VIP voice servers)
  vipRegions,

  /// guild has enabled the welcome screen
  welcomeScreenEnabled,
}
