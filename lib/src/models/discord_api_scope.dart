/// Dart conversion of the scopes used by the Discord API.
/// Should be noted that some of them are only usable by bots.
/// Should also be noted that some of them require Discord approval.
/// See the [Discord Oauth2 Documentation](https://discord.com/developers/docs/topics/oauth2) for more information.
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
    return name.replaceAllMapped(regExp, (match) => ('.${match.group(0)}')).toLowerCase();
    }
}