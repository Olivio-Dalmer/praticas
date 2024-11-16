import 'package:app02/Views/telainicial.dart';
import 'package:app02/models/message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/visualizadas.dart';
import '../models/conversa.dart';

class Chat extends StatelessWidget {
  final int index;
  final TextEditingController _controller = TextEditingController();

  Chat({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const TelaInicial(),
                  ),
                ),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Consumer<Visualizadas>(builder: (context, provider, child) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  provider.conversaList[index].icone,
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                provider.conversaList[index].titulo,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          );
        }),
        backgroundColor: const Color.fromARGB(255, 53, 53, 53),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Consumer<Visualizadas>(
              builder: (context, visualizadas, child) {
                List<Message> mensagens = visualizadas.obterMensagens(index);
                if (mensagens.isEmpty) {
                  return const SizedBox.shrink();
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: mensagens.length,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 27, 96, 42),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              mensagens[index].text,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(Icons.add, color: Colors.white),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: _controller,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.sticky_note_2_outlined,
                            color: Colors.white),
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 44, 44, 44),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.white,
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      Provider.of<Visualizadas>(context, listen: false)
                          .enviar(index, _controller.text);
                      _controller.clear();
                    }
                  },
                ),
                const SizedBox(width: 10),
                const Icon(Icons.mic_none, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
