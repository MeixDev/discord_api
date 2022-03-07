enum DiscordAuditLogEvent {
  /// Value: 1
  guildUpdate,

  /// Value: 10
  channelCreate,

  /// Value: 11
  channelUpdate,

  /// Value: 12
  channelDelete,

  /// Value: 13
  channelOverwriteCreate,

  /// Value: 14
  channelOverwriteUpdate,

  /// Value: 15
  channelOverwriteDelete,

  /// Value: 20
  memberKick,

  /// Value: 21
  memberPrune,

  /// Value: 22
  memberBanAdd,

  /// Value: 23
  memberBanRemove,

  /// Value: 24
  memberUpdate,

  /// Value: 25
  memberRoleUpdate,

  /// Value: 26
  memberMove,

  /// Value: 27
  memberDisconnect,

  /// Value: 28
  botAdd,

  /// Value: 30
  roleCreate,

  /// Value: 31
  roleUpdate,

  /// Value: 32
  roleDelete,

  /// Value: 40
  inviteCreate,

  /// Value: 41
  inviteUpdate,

  /// Value: 42
  inviteDelete,

  /// Value: 50
  webhookCreate,

  /// Value: 51
  webhookUpdate,

  /// Value: 52
  webhookDelete,

  /// Value: 60
  emojiCreate,

  /// Value: 61
  emojiUpdate,

  /// Value: 62
  emojiDelete,

  /// Value: 72
  messageDelete,

  /// Value: 73
  messageBulkDelete,

  /// Value: 74
  messagePin,

  /// Value: 75
  messageUnpin,

  /// Value: 80
  integrationCreate,

  /// Value: 81
  integrationUpdate,

  /// Value: 82
  integrationDelete,

  /// Value: 83
  stageInstanceCreate,

  /// Value: 84
  stageInstanceUpdate,

  /// Value: 85
  stageInstanceDelete,

  /// Value: 90
  stickerCreate,

  /// Value: 91
  stickerUpdate,

  /// Value: 92
  stickerDelete,

  /// Value: 100
  guildScheduledEventCreate,

  /// Value: 101
  guildScheduledEventUpdate,

  /// Value: 102
  guildScheduledEventDelete,

  /// Value: 110
  threadCreate,

  /// Value: 111
  threadUpdate,

  /// Value: 112
  threadDelete,
}

DiscordAuditLogEvent discordAuditLogEventFromValue(int v) {
  return DiscordAuditLogEvent.values.firstWhere((e) => e.toInt == v);
}

extension ApiValue on DiscordAuditLogEvent {
  int get toInt {
    switch (this) {
      case DiscordAuditLogEvent.guildUpdate:
        return 1;
      case DiscordAuditLogEvent.channelCreate:
        return 10;
      case DiscordAuditLogEvent.channelUpdate:
        return 11;
      case DiscordAuditLogEvent.channelDelete:
        return 12;
      case DiscordAuditLogEvent.channelOverwriteCreate:
        return 13;
      case DiscordAuditLogEvent.channelOverwriteUpdate:
        return 14;
      case DiscordAuditLogEvent.channelOverwriteDelete:
        return 15;
      case DiscordAuditLogEvent.memberKick:
        return 20;
      case DiscordAuditLogEvent.memberPrune:
        return 21;
      case DiscordAuditLogEvent.memberBanAdd:
        return 22;
      case DiscordAuditLogEvent.memberBanRemove:
        return 23;
      case DiscordAuditLogEvent.memberUpdate:
        return 24;
      case DiscordAuditLogEvent.memberRoleUpdate:
        return 25;
      case DiscordAuditLogEvent.memberMove:
        return 26;
      case DiscordAuditLogEvent.memberDisconnect:
        return 27;
      case DiscordAuditLogEvent.botAdd:
        return 28;
      case DiscordAuditLogEvent.roleCreate:
        return 30;
      case DiscordAuditLogEvent.roleUpdate:
        return 31;
      case DiscordAuditLogEvent.roleDelete:
        return 32;
      case DiscordAuditLogEvent.inviteCreate:
        return 40;
      case DiscordAuditLogEvent.inviteUpdate:
        return 41;
      case DiscordAuditLogEvent.inviteDelete:
        return 42;
      case DiscordAuditLogEvent.webhookCreate:
        return 50;
      case DiscordAuditLogEvent.webhookUpdate:
        return 51;
      case DiscordAuditLogEvent.webhookDelete:
        return 52;
      case DiscordAuditLogEvent.emojiCreate:
        return 60;
      case DiscordAuditLogEvent.emojiUpdate:
        return 61;
      case DiscordAuditLogEvent.emojiDelete:
        return 62;
      case DiscordAuditLogEvent.messageDelete:
        return 72;
      case DiscordAuditLogEvent.messageBulkDelete:
        return 73;
      case DiscordAuditLogEvent.messagePin:
        return 74;
      case DiscordAuditLogEvent.messageUnpin:
        return 75;
      case DiscordAuditLogEvent.integrationCreate:
        return 80;
      case DiscordAuditLogEvent.integrationUpdate:
        return 81;
      case DiscordAuditLogEvent.integrationDelete:
        return 82;
      case DiscordAuditLogEvent.stageInstanceCreate:
        return 83;
      case DiscordAuditLogEvent.stageInstanceUpdate:
        return 84;
      case DiscordAuditLogEvent.stageInstanceDelete:
        return 85;
      case DiscordAuditLogEvent.stickerCreate:
        return 90;
      case DiscordAuditLogEvent.stickerUpdate:
        return 91;
      case DiscordAuditLogEvent.stickerDelete:
        return 92;
      case DiscordAuditLogEvent.guildScheduledEventCreate:
        return 100;
      case DiscordAuditLogEvent.guildScheduledEventUpdate:
        return 101;
      case DiscordAuditLogEvent.guildScheduledEventDelete:
        return 102;
      case DiscordAuditLogEvent.threadCreate:
        return 110;
      case DiscordAuditLogEvent.threadUpdate:
        return 111;
      case DiscordAuditLogEvent.threadDelete:
        return 112;
    }
  }
}
