import 'package:flutter/material.dart';

// Cores aproximadas do Figma (confira com o conta-gotas se quiser exatidão)
const Color corTitulo = Color(0xFF3FA79D);
const Color corFundoBotao = Color(0xFFB8DEDB);
const Color corFundoTela = Color(0xFFFAFAFA);
const Color corTexto = Color(0xFF1E1E1E);
const Color corEstrela = Color(0xFFFFB400);
const String avisoSemTela = 'Tela ainda não disponível';

// Mostra uma mensagem na parte de baixo da tela
void mostrarAviso(BuildContext context, [String mensagem = avisoSemTela]) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(mensagem)),
  );
}

// Imagem do projeto; se o arquivo não existir, mostra um quadro cinza
Widget imagemOuCinza(String caminho, {BoxFit fit = BoxFit.cover, IconData? icone}) {
  return Image.asset(
    caminho,
    fit: fit,
    errorBuilder: (_, __, ___) => Container(
      color: const Color(0xFFD9D9D9),
      child: icone == null ? null : Center(child: Icon(icone, color: Colors.black45)),
    ),
  );
}
