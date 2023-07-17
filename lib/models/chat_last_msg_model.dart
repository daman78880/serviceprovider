/*
class ChatLastMsgModel {
  final String chatId;
  final String senderId;
  final String receiverId;
  final int msgType;
  final String msg;
  final String path;
  final int msgTime;

  ChatLastMsgModel(
      {required this.chatId, required this.senderId, required this.receiverId,
        required this.msgType, required this.msg, required this.path, required this.msgTime});
}

*/


class ChatLastMsgModel {
  String? chatId;
  String? senderId;
  String? receiverId;
  int? msgType;
  String? msg;
  String? path;
  int? msgTime;

  ChatLastMsgModel(
      {this.chatId,
        this.senderId,
        this.receiverId,
        this.msgType,
        this.msg,
        this.path,
        this.msgTime});

  ChatLastMsgModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chatId'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    msgType = json['msgType'];
    msg = json['msg'];
    path = json['path'];
    msgTime = json['msgTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chatId'] = this.chatId;
    data['senderId'] = this.senderId;
    data['receiverId'] = this.receiverId;
    data['msgType'] = this.msgType;
    data['msg'] = this.msg;
    data['path'] = this.path;
    data['msgTime'] = this.msgTime;
    return data;
  }
}
