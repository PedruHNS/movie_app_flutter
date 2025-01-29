import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int itemSelected;
  final void Function(int) onItemTap;
  final void Function() onSearchTap;
  final List<MenuItem> items;
  const BottomNav(
      {super.key,
      required this.itemSelected,
      required this.onItemTap,
      required this.onSearchTap,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 7,
                  spreadRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                items.length +
                    1, // Gera uma lista de widgets com base no número de itens mais um
                (index) {
                  if (index == (items.length ~/ 2)) {
                    // Verifica se o índice é o ponto médio da lista
                    return Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Adiciona padding ao redor do widget
                      child: InkWell(
                        onTap: onSearchTap,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.search, // Define o ícone do container
                            size: 32, // Define o tamanho do ícone
                            color: Color(0xFF7100cd), // Define a cor do ícone
                          ),
                        ),
                      ),
                    );
                  } else {
                    final itemIndex = index > items.length ~/ 2
                        ? index - 1
                        : index; // Ajusta o índice do item
                    final item = items[itemIndex]; // Obtém o item da lista
                    return Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Adiciona padding ao redor do widget
                      child: InkWell(
                        onTap: () => onItemTap(
                            itemIndex), // Define a função a ser chamada ao clicar no widget
                        child: Container(
                          width: 50, // Define a largura do container
                          height: 50, // Define a altura do container
                          decoration: BoxDecoration(
                            color: itemSelected == itemIndex
                                ? Colors.grey[
                                    200] // Define a cor de fundo se o item estiver selecionado
                                : Colors
                                    .transparent, // Define a cor de fundo se o item não estiver selecionado
                            borderRadius: BorderRadius.circular(
                                20), // Define o raio da borda do container
                          ),
                          child: Icon(
                            item.icon, // Define o ícone do container
                            size: itemSelected == itemIndex
                                ? 32
                                : 25, // Define o tamanho do ícone com base na seleção
                            color: itemSelected == itemIndex
                                ? Colors
                                    .black // Define a cor do ícone se o item estiver selecionado
                                : Color(
                                    0xFF7100cd), // Define a cor do ícone se o item não estiver selecionado
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String? title;
  final IconData icon;
  const MenuItem({this.title, required this.icon});
}
