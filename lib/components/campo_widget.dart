import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {
  const CampoWidget({
    Key? key,
    required this.campo,
    required this.onAbrir,
    required this.onAlternarMarcacao,
  }) : super(key: key);

  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  Widget _getImage() {
    int qtdeMinas = campo.qtdeMinasNaVizinhaca;
    var imagesPath = 'assets/images';
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('$imagesPath/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('$imagesPath/bomba_1.jpeg');
    } else if (campo.aberto) {
      return Image.asset('$imagesPath/aberto_$qtdeMinas.jpeg');
    } else if (campo.marcado) {
      return Image.asset('$imagesPath/bandeira.jpeg');
    } else {
      return Image.asset('$imagesPath/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
