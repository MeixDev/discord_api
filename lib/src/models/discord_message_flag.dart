enum DiscordMessageFlag {
  /// 1 << 0
  ///
  /// this message has been published to subscribed channels
  /// (via Channel Following)
  crossposted,

  /// 1 << 1
  ///
  /// this message originated from a message in another channel
  /// (via Channel Following)
  isCrosspost,

  /// 1 << 2
  ///
  /// do not include any embeds when serializing this message
  suppressEmbeds,

  /// 1 << 3
  ///
  /// the source message for this crosspost has been deleted
  /// (via Channel Following)
  sourceMessageDeleted,

  /// 1 << 4
  ///
  /// this message came from the urgent message system
  urgent,

  /// 1 << 5
  ///
  /// this message has an associated thread, with the same id as the message
  hasThread,

  /// 1 << 6
  ///
  ///	this message is only visible to the user who invoked the Interaction
  ephemeral,

  /// 1 << 7
  ///
  /// this message is an Interaction Response and the bot is "thinking"
  loading,

  /// 1 << 8
  ///
  /// this message failed to mention some roles and add their members
  /// to the thread
  failedToMentionSomeRolesInThread,
}
