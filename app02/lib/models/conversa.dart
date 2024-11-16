import 'package:app02/models/message.dart';

class Conversa {
  String icone;
  String titulo;
  String subtitulo;
  DateTime tempo;
  String descricao;
  bool estado;
  List<Message> messages;

  Conversa({
    required this.icone,
    required this.titulo,
    required this.subtitulo,
    required this.tempo,
    required this.descricao,
    required this.estado,
    required this.messages,
  });
}
