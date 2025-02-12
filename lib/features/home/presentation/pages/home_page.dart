import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_moteis_v1/config/injection_container.dart';
import 'package:guia_moteis_v1/config/themes/theme.dart';
import 'package:guia_moteis_v1/features/home/presentation/bloc/home_bloc.dart';
import 'package:guia_moteis_v1/features/home/presentation/bloc/home_event.dart';
import 'package:guia_moteis_v1/features/home/presentation/bloc/home_state.dart';

class MotelListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<MotelBloc>()..add(FetchMoteisEvent()),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 181, 30, 19),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              height: MediaQuery.sizeOf(context).height * 0.85,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: BlocBuilder<MotelBloc, MotelState>(
                builder: (context, state) {
                  if (state is MotelLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is MotelLoaded) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            state.moteis.first.nome,
                            style: AppTextStyles.heading2,
                          ),
                          subtitle: Text(
                            state.moteis.first.bairro,
                            style: AppTextStyles.bodyText,
                          ),
                          leading: Image.network(state.moteis.first.logo,
                              width: 50, height: 50),
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.moteis.first.suites.length,
                            itemBuilder: (context, index) {
                              final suite = state.moteis.first.suites;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      suite[index].imagem,
                                      width: 350,
                                      height: 250,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    suite[index].nome,
                                    style: AppTextStyles.heading3,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(color: Colors.white)
                                          ]),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        spacing: 10,
                                        children: [
                                          Text(
                                            'Preço Mínimo',
                                            style: AppTextStyles.bodyText,
                                          ),
                                          Text(
                                            "R\$${suite[index].precoMinimo.toString()}",
                                            style: AppTextStyles.heading3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    child: Card(
                                      child: Row(
                                        children: suite[index]
                                            .categoriaItens
                                            .map((categoria) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            child: Image.network(
                                              categoria.icone,
                                              width:
                                                  30, // Ajuste o tamanho conforme necessário
                                              height: 30,
                                              fit: BoxFit.contain,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (state is MotelError) {
                    return Center(child: Text(state.message));
                  }
                  return Center(child: Text('Nenhum motel encontrado'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
