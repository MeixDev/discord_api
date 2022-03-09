import 'discord_audit_log_entry.dart';
import 'discord_channel.dart';
import 'discord_guild_scheduled_event.dart';
import 'discord_integration.dart';
import 'discord_user.dart';
import 'discord_webhook.dart';

class DiscordAuditLog {
  /// list of audit log entries
  final List<DiscordAuditLogEntry> auditLogEntries;

  /// list of guild scheduled events found in the audit log
  final List<DiscordGuildScheduledEvent> guildScheduledEvents;

  /// list of partial integration objects
  final List<DiscordIntegration> integrations;

  /// list of threads found in the audit log
  ///
  /// * Threads referenced in THREAD_CREATE and THREAD_UPDATE
  /// events are included in the threads map, since archived
  /// threads might not be kept in memory by clients.
  final List<DiscordChannel> threads;

  /// list of users found in the audit log
  final List<DiscordUser> users;

  /// list of webhooks found in the audit log
  final List<DiscordWebhook> webhooks;

  static const auditLogEntriesEntry = 'audit_log_entries';
  static const guildScheduledEventsEntry = 'guild_scheduled_events';
  static const integrationsEntry = 'integrations';
  static const threadsEntry = 'threads';
  static const usersEntry = 'users';
  static const webhooksEntry = 'webhooks';

  DiscordAuditLog({
    required this.auditLogEntries,
    required this.guildScheduledEvents,
    required this.integrations,
    required this.threads,
    required this.users,
    required this.webhooks,
  });

  factory DiscordAuditLog.fromJson(Map<String, dynamic> json) =>
      DiscordAuditLog(
        auditLogEntries: List<DiscordAuditLogEntry>.from(
          (json[auditLogEntriesEntry] as List<Map<String, dynamic>>)
              .map(DiscordAuditLogEntry.fromJson),
        ),
        guildScheduledEvents: List<DiscordGuildScheduledEvent>.from(
          (json[guildScheduledEventsEntry] as List<Map<String, dynamic>>)
              .map(DiscordGuildScheduledEvent.fromJson),
        ),
        integrations: List<DiscordIntegration>.from(
          (json[integrationsEntry] as List<Map<String, dynamic>>)
              .map(DiscordIntegration.fromJson),
        ),
        threads: List<DiscordChannel>.from(
          (json[threadsEntry] as List<Map<String, dynamic>>)
              .map(DiscordChannel.fromJson),
        ),
        users: List<DiscordUser>.from(
          (json[usersEntry] as List<Map<String, dynamic>>)
              .map(DiscordUser.fromJson),
        ),
        webhooks: List<DiscordWebhook>.from(
          (json[webhooksEntry] as List<Map<String, dynamic>>)
              .map(DiscordWebhook.fromJson),
        ),
      );
}
