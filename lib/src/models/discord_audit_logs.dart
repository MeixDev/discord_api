import 'discord_channel.dart';
import 'discord_user.dart';

class DiscordAuditLogs {
  final List<DiscordAuditLogEntry> auditLogEntries;
  final List<DiscordGuildScheduledEvent> guildScheduledEvents;
  final List<DiscordIntegration> integrations;
  final List<DiscordChannel> threads;
  final List<DiscordUser> users;
  final List<DiscordWebhook> webhooks;
}
