import 'package:app02/Views/components/circle_title_type.dart';
import 'package:app02/Views/components/title_bottom_navigator.dart';
import 'package:app02/controllers/helpers.dart';
import 'package:app02/controllers/visualizadas.dart';
import 'package:flutter/material.dart';
import 'package:app02/models/conversas.dart';
import 'package:provider/provider.dart';
import 'package:app02/Views/chat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  void ordenateConversation() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Visualizadas>(context, listen: false).ordenateConversation();
    });
  }

  @override
  void initState() {
    ordenateConversation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabela = ConversarRepositorio.tabela;
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RawMaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  elevation: 2,
                  fillColor: const Color.fromARGB(255, 30, 30, 30),
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Transform.translate(
                  offset: const Offset(40, 0),
                  child: RawMaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(),
                    elevation: 2,
                    fillColor: const Color.fromARGB(255, 30, 30, 30),
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
                  fillColor: const Color.fromARGB(255, 30, 161, 1),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Conversas',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      style: const TextStyle(color: Colors.grey),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 2),
                        fillColor: Colors.grey.withOpacity(.3),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        hintText: 'Pesquisa',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 17),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.search, color: Colors.grey),
              ],
            ),
            SizedBox(height: 2.h),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleTitleType(title: "Tudo"),
                CircleTitleType(title: "Não lidas"),
                CircleTitleType(title: "Favoritas"),
                CircleTitleType(title: "Grupos"),
              ],
            ),
            SizedBox(height: 2.h),
            const Row(
              children: [
                SizedBox(width: 15),
                Icon(
                  Icons.indeterminate_check_box_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
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
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Consumer<Visualizadas>(
                    builder: (context, visualizadasProvider, child) {
                      var conversas = visualizadasProvider.conversaList[index];
                      return Container(
                        width: 100.w,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            visualizadasProvider.selecionarConversa(index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Chat(index: index),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 7.h,
                                width: 14.w,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(5.5),
                                child: Image.asset(
                                  conversas.icone,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: 60.w,
                                            margin: const EdgeInsets.only(
                                                bottom: 1),
                                            child: Text(
                                              conversas.titulo,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            formatHour(conversas.tempo),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: 60.w,
                                            margin: EdgeInsets.only(right: 3.w),
                                            child: Text(
                                              conversas.subtitulo,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          if (!conversas.estado)
                                            const Icon(
                                              Icons.circle,
                                              color: Colors.green,
                                              size: 12,
                                            )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(color: Colors.grey.withOpacity(.2)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                padding: const EdgeInsets.all(16),
                itemCount: tabela.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: TitleBottomNavigator(
              title: "Actualizações",
              icon: Icons.blur_circular,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: TitleBottomNavigator(
              title: "Chamadas",
              icon: Icons.phone_outlined,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: TitleBottomNavigator(
              title: "Comunidades",
              icon: Icons.people_outline,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: TitleBottomNavigator(
              title: "Conversas",
              icon: Icons.chat_rounded,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: TitleBottomNavigator(
              title: "Definições",
              icon: Icons.brightness_high,
            ),
            label: "",
          ),
        ],
        backgroundColor: Colors.black87,
      ),
    );
  }
}
