import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_moteis_v1/config/injection_container.dart';
import 'package:guia_moteis_v1/features/home/presentation/bloc/home_bloc.dart';
import 'package:guia_moteis_v1/features/home/presentation/bloc/home_event.dart';
import 'package:guia_moteis_v1/features/home/presentation/bloc/home_state.dart';

class MotelListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<MotelBloc>()..add(FetchMoteisEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text('Lista de Motéis')),
        body: BlocBuilder<MotelBloc, MotelState>(
          builder: (context, state) {
            if (state is MotelLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MotelLoaded) {
              return ListView.builder(
                itemCount: state.moteis.length,
                itemBuilder: (context, index) {
                  final motel = state.moteis[index];
                  return ListTile(
                    title: Text(motel.nome),
                    subtitle: Text(motel.bairro),
                    leading: Image.network(motel.logo, width: 50, height: 50),
                  );
                },
              );
            } else if (state is MotelError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('Nenhum motel encontrado'));
          },
        ),
      ),
    );
  }
}
