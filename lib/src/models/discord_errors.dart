class DiscordErrors {

  /// The error code sent by Discord.
  final int code;

  /// The specification of the error. Differs from error type to error type.
  final Map<String, dynamic> errors;

  /// An human readable error message.
  final String message;

  DiscordErrors({
    required this.code,
    required this.message,
    required this.errors,
  });

  factory DiscordErrors.fromJson(Map<String, dynamic> json) => DiscordErrors(
      code: json['code'],
      message: json['message'],
      errors: json['errors'] as Map<String, dynamic>,
      );
}