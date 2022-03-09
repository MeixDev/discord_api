enum DiscordChannelType {
  /// a text channel within a server
  guildText,

  /// a direct message between users
  dm,

  /// a voice channel within a server
  guildVoice,

  /// a direct message between multiple users
  groupDm,

  /// an [organizational category](https://support.discord.com/hc/en-us/articles/115001580171-Channel-Categories-101)
  /// that contains up to 50 channels
  guildCategory,

  /// a channel that [users can follow and crosspost into their own server](https://support.discord.com/hc/en-us/articles/360032008192)
  guildNews,

  /// a channel in which game developers can [sell their game on Discord]()
  guildStore,

  unused7,
  unused8,
  unused9,

  /// a temporary sub-channel within a GUILD_NEWS channel
  ///
  /// only available in API v9
  guildNewsThread,

  /// a temporary sub-channel within a GUILD_TEXT channel
  ///
  /// only available in API v9
  guildPublicThread,

  /// a temporary sub-channel within a GUILD_TEXT channel that is only viewable
  /// by those invited and those with the MANAGE_THREADS permission
  ///
  /// only available in API v9
  guildPrivateThread,

  /// a voice channel for [hosting events with an audience](https://support.discord.com/hc/en-us/articles/1500005513722)
  guildStageVoice,
}
