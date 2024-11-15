import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/visualizadas.dart';
import '../models/conversa.dart';

class Chat extends StatelessWidget {
  final Conversa conversa;
  final TextEditingController _controller = TextEditingController();

  Chat({Key? key, required this.conversa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                conversa.icone,
                width: 30.0,
                height: 30.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Text(
              conversa.titulo,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 53, 53, 53),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Consumer<Visualizadas>(
              builder: (context, visualizadas, child) {
                List<String> mensagens = visualizadas.obterMensagens(conversa.titulo);
                if (mensagens.isEmpty) {
                  return SizedBox.shrink();
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: mensagens.length,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 27, 96, 42),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              mensagens[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _controller,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.sticky_note_2_outlined, color: Colors.white),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 44, 44, 44),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.white,
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      Provider.of<Visualizadas>(context, listen: false)
                          .enviar(conversa.titulo, _controller.text);
                      _controller.clear();
                    }
                  },
                ),
                SizedBox(width: 10),
                Icon(Icons.mic_none, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
