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

List<DiscordGuildFeature> discordGuildFeaturesFromValues(
    List<String> features) {
  final list = <DiscordGuildFeature>[];
  for (final feature in features) {
    switch (feature) {
      case "ANIMATED_ICON":
        list.add(DiscordGuildFeature.animatedIcon);
        break;
      case "BANNER":
        list.add(DiscordGuildFeature.banner);
        break;
      case "COMMERCE":
        list.add(DiscordGuildFeature.commerce);
        break;
      case "COMMUNITY":
        list.add(DiscordGuildFeature.community);
        break;
      case "DISCOVERABLE":
        list.add(DiscordGuildFeature.discoverable);
        break;
      case "FEATURABLE":
        list.add(DiscordGuildFeature.featurable);
        break;
      case "INVITE_SPLASH":
        list.add(DiscordGuildFeature.inviteSplash);
        break;
      case "MEMBER_VERIFICATION_GATE_ENABLED":
        list.add(DiscordGuildFeature.memberVerificationGateEnable);
        break;
      case "MONETIZATION_ENABLED":
        list.add(DiscordGuildFeature.monetizationEnabled);
        break;
      case "MORE_STICKERS":
        list.add(DiscordGuildFeature.moreStickers);
        break;
      case "NEWS":
        list.add(DiscordGuildFeature.news);
        break;
      case "PARTNERED":
        list.add(DiscordGuildFeature.partnered);
        break;
      case "PREVIEW_ENABLED":
        list.add(DiscordGuildFeature.previewEnabled);
        break;
      case "PRIVATE_THREADS":
        list.add(DiscordGuildFeature.privateThreads);
        break;
      case "ROLE_ICONS":
        list.add(DiscordGuildFeature.roleIcons);
        break;
      case "SEVEN_DAY_THREAD_ARCHIVE":
        list.add(DiscordGuildFeature.sevenDayThreadArchive);
        break;
      case "THREE_DAY_THREAD_ARCHIVE":
        list.add(DiscordGuildFeature.threeDayThreadArchive);
        break;
      case "TICKETED_EVENTS_ENABLED":
        list.add(DiscordGuildFeature.ticketedEventsEnabled);
        break;
      case "VANITY_URL":
        list.add(DiscordGuildFeature.vanityUrl);
        break;
      case "VERIFIED":
        list.add(DiscordGuildFeature.verified);
        break;
      case "VIP_REGIONS":
        list.add(DiscordGuildFeature.vipRegions);
        break;
      case "WELCOME_SCREEN_ENABLED":
        list.add(DiscordGuildFeature.welcomeScreenEnabled);
        break;
    }
  }
  return list;
}
