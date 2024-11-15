import 'package:flutter/material.dart';
import 'package:app02/models/conversa.dart';
import 'package:app02/models/conversas.dart';

class Visualizadas extends ChangeNotifier {
  List<Conversa> conversaList = ConversarRepositorio.tabela;
  Map<String, List<String>> mensagensPorConversa = {};

  void selecionarConversa(int index) {
    conversaList[index].estado = !conversaList[index].estado;
    notifyListeners();
  }

  List<String> obterMensagens(String conversaTitulo) {
    return mensagensPorConversa[conversaTitulo] ?? [];
  }

  void enviar(String conversaTitulo, String texto) {
    if (mensagensPorConversa.containsKey(conversaTitulo)) {
      mensagensPorConversa[conversaTitulo]!.add(texto);
    } else {
      mensagensPorConversa[conversaTitulo] = [texto];
    }
    notifyListeners();
  }
}
