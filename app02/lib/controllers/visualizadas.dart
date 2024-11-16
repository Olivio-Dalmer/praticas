import 'package:app02/models/message.dart';
import 'package:flutter/material.dart';
import 'package:app02/models/conversa.dart';
import 'package:app02/models/conversas.dart';

class Visualizadas extends ChangeNotifier {
  List<Conversa> conversaList = ConversarRepositorio.tabela;

  void selecionarConversa(int index) {
    conversaList[index].estado = !conversaList[index].estado;
    notifyListeners();
  }

  List<Message> obterMensagens(int index) {
    return conversaList[index].messages;
  }

  void ordenateConversation() {
    conversaList.sort((a, b) => b.tempo.compareTo(a.tempo));
    notifyListeners();
  }

  void enviar(int index, String texto) {
    conversaList[index].messages.add(Message(text: texto));
    conversaList[index].tempo = DateTime.now();
    conversaList[index].subtitulo = texto;
    notifyListeners();
  }
}
