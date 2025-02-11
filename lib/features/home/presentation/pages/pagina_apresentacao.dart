import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guia_moteis_v1/features/home/presentation/pages/modal_sheet.dart';

class PaginaApresentacaoPage extends StatefulWidget {
  const PaginaApresentacaoPage({super.key});

  @override
  State<PaginaApresentacaoPage> createState() => _PaginaApresentacaoPageState();
}

class _PaginaApresentacaoPageState extends State<PaginaApresentacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 181, 30, 19),
      body: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            height: MediaQuery.sizeOf(context).height * 0.85,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Link Motel',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '6,3km - Morada Nova - Cabedelo',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9832-Le-Nid/fotos/foto1-suites.jpg",
                                  width: 350,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('name Suite'),
                            ],
                          );
                        })),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  child: Row(
                    spacing: 15,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_arrow),
                    ],
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                                    
                                  ]
                                ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  child: DetalhesMotel(),
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                                    
                                  ]
                                ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
