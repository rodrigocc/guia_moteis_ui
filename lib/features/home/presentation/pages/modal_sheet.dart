import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetalhesMotel extends StatelessWidget {
  const DetalhesMotel({super.key});

  void _mostrarModal(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Todas as comodidades",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(5, (index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.star,
                        size: 32), // Substituir pelo ícone correto
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Componente de Comodidades
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.star,
                        size: 32), // Substituir pelo ícone correto
                  ),
                );
              }),
            ),
            GestureDetector(
              onTap: () => _mostrarModal(context),
              child: Row(
                children: [
                  Text("ver todos"),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ],
        ),

        // Primeiro novo container
      ],
    );
  }
}
