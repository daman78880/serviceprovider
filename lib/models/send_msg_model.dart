class SendMsgModel{
  final String msg;
  final int msgType;
  final int msgTime;
  final String senderId;
  final String receiverId;
  final String chatId;
  final String path;
  SendMsgModel({required this.msg,required this.msgType,required this.msgTime,required this.chatId,required this.senderId,required this.receiverId,required this.path});

  SendMsgModel.fromJson(Map<String, Object?> json)
      : this(
    msg: json['msg']! as String,
    msgType: json['msgType']! as int,
    msgTime: json['msgTime']! as int,
    senderId: json['senderId']! as String,
    chatId: json['chatId']! as String,
    receiverId: json['receiverId']! as String,
    path: json['path']! as String,
  );
  Map<String, Object?> toJson() {
    return {
      'msg': msg,
      'msgType': msgType,
      'msgTime': msgTime,
      'senderId': senderId,
      'path': path,
      'receiverId': receiverId,
      'chatId': chatId,
    };
  }
}