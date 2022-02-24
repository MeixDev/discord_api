/// Once `status` is set to `COMPLETED` or `CANCELED`,
/// the `status` can no longer be updated.
///
/// **Valid Guild Scheduled Event Status Transitions** \
/// SCHEDULED --> ACTIVE \
/// ACTIVE --------> COMPLETED \
/// SCHEDULED --> CANCELED
enum DiscordGuildScheduledEventStatus {
  unused,
  scheduled,
  active,
  completed,
  canceled,
}
