import 'package:flutter/material.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'Dictionary',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/app_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Common Words',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildDataTable(commonWords),
                  const SizedBox(height: 20),
                  const Text(
                    'Restaurant Phrases',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildDataTable(restaurantPhrases),
                  const SizedBox(height: 20),
                  const Text(
                    'Social Phrases',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildDataTable(socialPhrases),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataTable(List<Map<String, String>> data) {
    return DataTable(
      columns: const [
        DataColumn(
            label: Text('Portuguese',
                style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label:
                Text('English', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: data
          .map(
            (word) => DataRow(cells: [
              DataCell(Text(word['pt']!)),
              DataCell(Text(word['en']!)),
            ]),
          )
          .toList(),
    );
  }
}

final List<Map<String, String>> commonWords = [
  {'pt': 'Olá', 'en': 'Hello'},
  {'pt': 'Obrigado (m) / Obrigada (f)', 'en': 'Thank you'},
  {'pt': 'Sim', 'en': 'Yes'},
  {'pt': 'Não', 'en': 'No'},
  {'pt': 'Por favor', 'en': 'Please'},
  {'pt': 'Desculpe', 'en': 'Sorry'},
  {'pt': 'Ajuda', 'en': 'Help'},
  {'pt': 'Bom dia', 'en': 'Good morning'},
  {'pt': 'Boa tarde', 'en': 'Good afternoon'},
  {'pt': 'Boa noite', 'en': 'Good evening / Good night'},
  {'pt': 'Tchau', 'en': 'Goodbye'},
  {'pt': 'Até logo', 'en': 'See you later'},
  {'pt': 'Saúde!', 'en': 'Bless you! / Cheers!'},
  {'pt': 'Com licença', 'en': 'Excuse me'},
];

final List<Map<String, String>> restaurantPhrases = [
  {
    'pt': 'Eu gostaria de um menu, por favor.',
    'en': 'I would like a menu, please.'
  },
  {'pt': 'O que você recomenda?', 'en': 'What do you recommend?'},
  {'pt': 'Eu sou alérgico a...', 'en': 'I am allergic to...'},
  {'pt': 'A conta, por favor.', 'en': 'The bill, please.'},
  {'pt': 'Posso pagar com cartão?', 'en': 'Can I pay with a card?'},
  {'pt': 'Eu gostaria de...', 'en': 'I would like...'},
  {'pt': 'A comida está deliciosa!', 'en': 'The food is delicious!'},
];

final List<Map<String, String>> socialPhrases = [
  {'pt': 'Como você está?', 'en': 'How are you?'},
  {'pt': 'Qual é o seu nome?', 'en': 'What is your name?'},
  {'pt': 'De onde você é?', 'en': 'Where are you from?'},
  {'pt': 'Prazer em conhecê-lo!', 'en': 'Nice to meet you!'},
  {'pt': 'Você fala inglês?', 'en': 'Do you speak English?'},
  {'pt': 'Eu não entendo', 'en': 'I do not understand'},
  {'pt': 'Eu estou aprendendo português', 'en': 'I am learning Portuguese'},
  {'pt': 'Você pode me ajudar?', 'en': 'Can you help me?'},
  {'pt': 'O que significa isso?', 'en': 'What does this mean?'},
  {'pt': 'Eu gosto deste lugar', 'en': 'I like this place'},
];
