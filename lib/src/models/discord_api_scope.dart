enum DiscordApiScope {
  activitiesRead,
  activitiesWrite,
  applicationsBuildsRead,
  applicationsBuildsUpload,
  applicationsCommands,
  applicationsCommandsUpdate,
  applicationsEntitlements,
  applicationsStoreUpdate,
  bot,
  connections,
  email,
  gdmJoin,
  guilds,
  guildsJoin,
  guilsMembersRead,
  identify,
  messagesRead,
  rpc,
  rpcActivitiesWrite,
  rpcNotificationsRead,
  rpcVoiceRead,
  rpcVoiceWrite,
  webhookIncoming,
}

extension DiscordApiScopeModifier on DiscordApiScope {
  String get string {
    RegExp regExp = RegExp(r'(?<=[a-z])[A-Z]');
    return name
        .replaceAllMapped(regExp, (match) => ('.${match.group(0)}'))
        .toLowerCase();
  }
}
