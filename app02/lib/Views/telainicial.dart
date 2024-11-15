import 'package:app02/controllers/visualizadas.dart';
import 'package:app02/models/conversa.dart';
import 'package:flutter/material.dart';
import 'package:app02/models/conversas.dart';
import 'package:provider/provider.dart';
import 'package:app02/Views/chat.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});
  void abrirConversa(BuildContext context, Conversa conversa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Chat(conversa: conversa),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabela = ConversarRepositorio.tabela;
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(),
                    elevation: 2,
                    fillColor: Color.fromARGB(255, 30, 30, 30),
                    child: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Transform.translate(
                    offset: Offset(40, 0),
                    child: RawMaterialButton(
                      onPressed: () {},
                      shape: const CircleBorder(),
                      elevation: 2,
                      fillColor: Color.fromARGB(255, 30, 30, 30),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(),
                    elevation: 2,
                    fillColor: Color.fromARGB(255, 30, 161, 1),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ]),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,  // Alinha todos os widgets à esquerda
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Conversas',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            hintText: 'Pesquisa',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
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
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                )
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Tudo',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 30, 30, 30)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Não lidas',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 30, 30, 30)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Favoritos',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 30, 30, 30)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Grupos',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 30, 30, 30)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.indeterminate_check_box_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Arquivadas',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Spacer(),
                Text(
                  '1',
                  style: TextStyle(
                      color: Color.fromARGB(214, 72, 255, 0), fontSize: 16),
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Consumer<Visualizadas>(
                    builder: (context, visualizadasProvider, child) {
                      var conversas = visualizadasProvider.conversaList[index];
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            conversas.icone,
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          conversas.titulo,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          conversas.subtitulo,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              conversas.tempo,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            if (!conversas.estado)
                              Icon(
                                Icons.circle,
                                color: Colors.green,
                              )
                          ],
                        ),
                        selectedTileColor: Colors.amber,
                        onTap: () {
                          visualizadasProvider.selecionarConversa(index);
                          abrirConversa(context, conversas);
                        },
                      );
                    },
                  );
                },
                padding: EdgeInsets.all(16),
                separatorBuilder: (_, __) => Divider(),
                itemCount: tabela.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.blur_circular,
                color: Colors.grey,
              ),
              label: 'Atualizações'),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_outlined, color: Colors.grey),
              label: 'Chamadas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline, color: Colors.grey),
              label: 'Comunidades'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded, color: Colors.grey),
              label: 'Conversas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.brightness_high_outlined, color: Colors.grey),
              label: 'Definições'),
        ],
        backgroundColor: Color.fromARGB(255, 61, 61, 61),
      ),
    );
  }
}
