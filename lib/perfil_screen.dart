import 'package:flutter/material.dart';

import 'constantes.dart';
import 'segunda_tela.dart';

class _Avaliacao {
  final String nome;
  final int estrelas;
  final String data;
  const _Avaliacao(this.nome, this.estrelas, this.data);
}

const String _textoAvaliacao =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua.';

const List<_Avaliacao> _avaliacoes = [
  _Avaliacao('Peter Parker', 4, '2 Bulan yang lalu'),
  _Avaliacao("T'chala", 3, '1 Bulan yang lalu'),
  _Avaliacao('Tony Stark', 5, '2 Bulan yang lalu'),
  _Avaliacao('Peter Quil', 4, '2 Bulan yang lalu'),
  _Avaliacao('Wanda Maximof', 5, '2 Bulan yang lalu'),
];

const List<int> _contagemPorNota = [70, 5, 8, 2, 1]; // de 5 a 1 estrela

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: Column(
              children: [
                _barraSuperior(context),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    children: [
                      _cabecalho(context),
                      const SizedBox(height: 16),
                      _fotos(),
                      const SizedBox(height: 20),
                      _resumo(),
                      const SizedBox(height: 12),
                      for (var i = 0; i < _avaliacoes.length; i++)
                        _cartaoAvaliacao(_avaliacoes[i], i + 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _barraSuperior(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Color(0x1F000000), blurRadius: 4, offset: Offset(0, 1))],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: corTexto),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Text(
            'Marcia Store',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: corTexto),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, size: 18, color: corEstrela),
                  SizedBox(width: 4),
                  Text('4.6', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cabecalho(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 95,
          height: 95,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Color(0x33000000), blurRadius: 4, offset: Offset(1, 2))],
          ),
          child: imagemOuCinza('assets/marcia_logo.png', fit: BoxFit.contain),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Márcia Store',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('Loja de roupas femininas', style: TextStyle(fontSize: 10)),
              const SizedBox(height: 14),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _icone(context, 'assets/instagram.png', Icons.camera_alt_outlined),
                  _icone(context, 'assets/whatsapp.png', Icons.chat),
                  _icone(context, 'assets/google.png', Icons.g_mobiledata),
                  Material(
                    color: corFundoBotao,
                    shape: const StadiumBorder(),
                    child: InkWell(
                      customBorder: const StadiumBorder(),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SegundaTelaRota()),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text('Como chegar', style: TextStyle(fontSize: 16, color: corTexto)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _icone(BuildContext context, String caminho, IconData reserva) {
    return InkWell(
      onTap: () => mostrarAviso(context),
      child: SizedBox(
        width: 26,
        height: 26,
        child: Image.asset(
          caminho,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Icon(reserva, size: 26, color: corTexto),
        ),
      ),
    );
  }

  Widget _fotos() {
    return SizedBox(
      height: 118,
      child: Row(
        children: [
          Expanded(flex: 83, child: imagemOuCinza('assets/produto_1.png')),
          const SizedBox(width: 8),
          Expanded(flex: 67, child: imagemOuCinza('assets/produto_2.png')),
          const SizedBox(width: 8),
          Expanded(flex: 120, child: imagemOuCinza('assets/produto_3.png')),
        ],
      ),
    );
  }

  Widget _estrelas(int cheias, double tamanho) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (i) => Icon(
          i < cheias ? Icons.star : Icons.star_border,
          size: tamanho,
          color: i < cheias ? corEstrela : const Color(0xFFBDBDBD),
        ),
      ),
    );
  }

  Widget _resumo() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final larguraNota = constraints.maxWidth * 0.28;

        return Row(
          children: [
            SizedBox(
              width: larguraNota.clamp(90.0, 120.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('4.6', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        Text(' / 5', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('86 Reviews', style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  for (var i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          _estrelas(5 - i, 12),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: _contagemPorNota[i] / 70,
                                minHeight: 4,
                                color: corEstrela,
                                backgroundColor: const Color(0xFFE6E6E6),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 24,
                            child: Text('${_contagemPorNota[i]}',
                                textAlign: TextAlign.right,
                                style: const TextStyle(fontSize: 11)),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _cartaoAvaliacao(_Avaliacao a, int numero) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: SizedBox(
              width: 44,
              height: 44,
              child: imagemOuCinza('assets/avatar_$numero.png', icone: Icons.person),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(a.nome,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    Text(a.data,
                        style: const TextStyle(fontSize: 11, color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 4),
                _estrelas(a.estrelas, 14),
                const SizedBox(height: 8),
                const Text(_textoAvaliacao, style: TextStyle(fontSize: 12, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
