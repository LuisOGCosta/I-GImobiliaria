// widgets/imovel_widget.dart - VERSÃO ATUALIZADA

import 'package:atividade3/widgets/financiamento_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> casas = const [
    {
      'nome': 'Mansão Vale do Sol',
      'preco': 10000000,
      'local': 'Nova Lima',
      'imagem': 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c',
      'descricao': 'Luxuosa mansão com 5 quartos, piscina, jardim amplo e vista panorâmica das montanhas. Acabamento de primeira qualidade com materiais importados.',
      'area': 850,
      'quartos': 5,
      'banheiros': 6,
      'vagas': 4,
    },
    {
      'nome': 'Residência Alto das Montanhas',
      'preco': 15000000,
      'local': 'Nova Lima',
      'imagem': 'img/CasaNasMontanhas.webp',
      'descricao': 'Casa de alto padrão com arquitetura moderna, sistema de automação completo, adega climatizada e área gourmet com churrasqueira.',
      'area': 1200,
      'quartos': 6,
      'banheiros': 8,
      'vagas': 6,
    },
    {
      'nome': 'Casa Jardim Secreto',
      'preco': 5000000,
      'local': 'Nova Lima',
      'imagem': 'img/jardimSecreto.jpg',
      'descricao': 'Charmosa residência em condomínio fechado, com jardim paisagístico, sala de estar com lareira e cozinha americana planejada.',
      'area': 450,
      'quartos': 4,
      'banheiros': 3,
      'vagas': 2,
    },
  ];

  final List<Map<String, dynamic>> casasGeminadas = const [
    {
      'nome': 'Residencial Duas Irmãs',
      'preco': 2800000,
      'local': 'Nova Lima',
      'imagem': 'img/CasasGeminadas.webp',
      'descricao': 'Casa geminada moderna com 3 quartos, quintal privativo, área de serviço coberta e portão eletrônico. Ideal para famílias.',
      'area': 180,
      'quartos': 3,
      'banheiros': 2,
      'vagas': 2,
    },
    {
      'nome': 'Duplex Vila Verde',
      'preco': 3200000,
      'local': 'Nova Lima',
      'imagem': 'img/Duplex Vila Verde.jpg',
      'descricao': 'Casa geminada em duplex com design contemporâneo, terraço no andar superior, cozinha integrada e área gourmet.',
      'area': 220,
      'quartos': 3,
      'banheiros': 3,
      'vagas': 2,
    },
    {
      'nome': 'Geminadas Harmonia',
      'preco': 2200000,
      'local': 'Nova Lima',
      'imagem': 'img/Geminadas Harmonia.jpg',
      'descricao': 'Casa geminada em condomínio fechado com segurança 24h, piscina comunitária, playground e salão de festas.',
      'area': 160,
      'quartos': 3,
      'banheiros': 2,
      'vagas': 2,
    },

  ];

  final List<Map<String, dynamic>> apartamentos = const [
    {
      'nome': 'Edifício Bellavista',
      'preco': 1800000,
      'local': 'Nova Lima',
      'imagem': 'https://images.unsplash.com/photo-1460317442991-0ec209397118',
      'descricao': 'Apartamento de alto padrão com 3 quartos sendo 1 suíte, varanda gourmet, área de lazer completa com piscina e academia.',
      'area': 120,
      'quartos': 3,
      'banheiros': 2,
      'vagas': 2,
    },
    {
      'nome': 'Residencial Montanha Verde',
      'preco': 1200000,
      'local': 'Nova Lima',
      'imagem': 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688',
      'descricao': 'Apartamento aconchegante com 2 quartos, sala ampla, cozinha planejada e vista para as montanhas. Prédio com elevador.',
      'area': 85,
      'quartos': 2,
      'banheiros': 2,
      'vagas': 1,
    },
    {
      'nome': 'Cobertura Mirante',
      'preco': 3500000,
      'local': 'Nova Lima',
      'imagem': 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2',
      'descricao': 'Cobertura duplex com terraço privativo, churrasqueira, jacuzzi e vista panorâmica. Acabamento de luxo com materiais nobres.',
      'area': 250,
      'quartos': 4,
      'banheiros': 4,
      'vagas': 3,
    },
    
  ];

  List<Map<String, dynamic>> get currentImoveis {
    switch (_selectedIndex) {
      case 0:
        return casas;
      case 1:
        return casasGeminadas;
      case 2:
        return apartamentos;
      default:
        return casas;
    }
  }

  String get currentTitle {
    switch (_selectedIndex) {
      case 0:
        return 'Casas em Nova Lima';
      case 1:
        return 'Casas Geminadas em Nova Lima';
      case 2:
        return 'Apartamentos em Nova Lima';
      default:
        return 'Imóveis em Nova Lima';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: currentImoveis.length,
        itemBuilder: (context, index) {
          final imovel = currentImoveis[index];
          return Card(
            margin: const EdgeInsets.all(12),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imovel['imagem'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[300],
                      child: const Icon(Icons.home, size: 40, color: Colors.grey),
                    );
                  },
                ),
              ),
              title: Text(
                imovel['nome'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Local: ${imovel['local']}'),
                  Text(
                    'R\$ ${(imovel['preco'] as int).toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text('${imovel['area']}m² • ${imovel['quartos']} quartos • ${imovel['vagas']} vagas'),
                ],
              ),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetalheImovelPage(imovel: imovel),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Casas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: 'Geminadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment),
            label: 'Apartamentos',
          ),
        ],
      ),
    );
  }
}

class DetalheImovelPage extends StatelessWidget {
  final Map<String, dynamic> imovel;

  const DetalheImovelPage({super.key, required this.imovel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(imovel['nome']),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imovel['imagem'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(Icons.home, size: 80, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            
            // Informações principais
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informações do Imóvel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.red),
                        const SizedBox(width: 8),
                        Text('Localização: ${imovel['local']}', 
                             style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.attach_money, color: Colors.green),
                        const SizedBox(width: 8),
                        Text(
                          'R\$ ${(imovel['preco'] as int).toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Características
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Características',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCaracteristica(Icons.square_foot, '${imovel['area']}m²', 'Área'),
                        _buildCaracteristica(Icons.bed, '${imovel['quartos']}', 'Quartos'),
                        _buildCaracteristica(Icons.bathtub, '${imovel['banheiros']}', 'Banheiros'),
                        _buildCaracteristica(Icons.directions_car, '${imovel['vagas']}', 'Vagas'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Descrição
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Descrição',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      imovel['descricao'],
                      style: const TextStyle(fontSize: 16, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Botões de ação
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Entrando em contato...')),
                      );
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text('Entrar em Contato'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Agendando visita...')),
                      );
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: const Text('Agendar Visita'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            SizedBox(
  width: double.infinity,
  child: ElevatedButton.icon(
    onPressed: () {
      // Primeiro, mostra o SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Simulando financiamento...')),
      );

      // Depois, navega para a próxima tela
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FinanciamentoWidget(casa: imovel),
        ),
      );
    },
    icon: const Icon(Icons.calculate),
    label: const Text('Simular Financiamento'),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12),
    ),
  ),
),

          ],
        ),
      ),
    );
  }

  Widget _buildCaracteristica(IconData icon, String valor, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.teal),
        const SizedBox(height: 4),
        Text(
          valor,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
