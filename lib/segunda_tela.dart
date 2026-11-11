import 'package:flutter/material.dart';

class SegundaTelaRota extends StatelessWidget {
  const SegundaTelaRota({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2BA39B),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Rota',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEAF1F0),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFEAEAEA), Color(0xFFE5EFEF)],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Color(0xFFDAEFEF), Color(0xFFF4F8F7)],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: const Color(0x66D6EFEA),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.location_on,
                                    size: 54,
                                    color: Color(0xFF2BA39B),
                                  ),
                                ),
                                const SizedBox(height: 14),
                                const Text(
                                  'Mapa de rota - 15 min',
                                  style: TextStyle(
                                    color: Color(0xFF4A4A4A),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 24,
                            top: 28,
                            child: _pontoRota(Icons.location_on, const Color(0xFF2BA39B)),
                          ),
                          Positioned(
                            right: 28,
                            bottom: 70,
                            child: _pontoRota(Icons.store, const Color(0xFF7C8A89)),
                          ),
                          Positioned(
                            left: 70,
                            bottom: 80,
                            child: _pontoRota(Icons.trip_origin, const Color(0xFFB9E2DF)),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -18),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1A000000),
                              blurRadius: 12,
                              spreadRadius: 2,
                              offset: Offset(0, -4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '15 minutos até o local',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF1E1E1E),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                Container(
                                  width: 58,
                                  height: 58,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEAF8F7),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: const Icon(
                                    Icons.store,
                                    color: Color(0xFF2BA39B),
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Márcia Store',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Color(0xFF1F1F1F),
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Moda feminina',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.camera_alt, color: Colors.grey, size: 22),
                                const SizedBox(width: 14),
                                const Icon(Icons.chat, color: Colors.grey, size: 22),
                              ],
                            ),
                            const SizedBox(height: 18),
                            const Divider(height: 1, color: Color(0xFFE7E7E7)),
                            const SizedBox(height: 18),
                            const _InfoLinha(
                              icon: Icons.location_on,
                              texto: 'Rua Cristo Pequenopolis, 936, Taquaral\nLoja UrbanFix',
                            ),
                            const SizedBox(height: 16),
                            const _InfoLinha(
                              icon: Icons.access_time,
                              texto: 'Horário de atendimento: 09:00 às 18:00',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pontoRota(IconData icon, Color color) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x1A000000), blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Icon(icon, color: color, size: 26),
    );
  }
}

class _InfoLinha extends StatelessWidget {
  final IconData icon;
  final String texto;

  const _InfoLinha({required this.icon, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF8F7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF2BA39B), size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1E1E1E),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
