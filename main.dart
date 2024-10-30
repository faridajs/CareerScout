import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  runApp(JobSearchApp());
}

class JobSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Career Scout',
      theme: ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: JobSearchPage(),
    );
  }
}

class JobSearchPage extends StatefulWidget {
  @override
  _JobSearchPageState createState() => _JobSearchPageState();
}



class CvMakerPage extends StatefulWidget {
  @override
  _CvMakerPageState createState() => _CvMakerPageState();
} 

class ChatMessage {
  final String text;
  final DateTime timestamp;
  final String sender;

  ChatMessage({required this.text, required this.timestamp, required this.sender});
}

class _CvMakerPageState extends State<CvMakerPage> {
final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = []; 
  
  Widget build(BuildContext context) {
    // Здесь вы строите пользовательский интерфейс для страницы поиска работы
    return Scaffold(
      appBar: AppBar(
        title: Text('String'),
      ),
      body: Center(
        child: Text('String'),
      ),
    );
  }
}

Future<void> _sendMessage() async {
  final apiKey = Platform.environment['GEMINI_API_KEY'];
  if (apiKey == null) {
    stderr.writeln(r'No $GEMINI_API_KEY environment variable');
    exit(1);
  }

  
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CV Maker'),),
      body: Center(
        child: Column(
          children: [
            
            final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: 'AIzaSyB7Emo9bRNLzTndl7LAgGlDBqcq4Ywm7BQ', 
      generationConfig: GenerationConfig(
        temperature: 0.25,
        topK: 64,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'text/plain',
      ),
      systemInstruction: Content.system(
          'ask user information and create a CV in a professional manner/or just give the example of cv'));

  final response = await chat.sendMessage(Content.text(messageController.text)
            );
          ],
        ),
      ),
    );
  }


class _JobSearchPageState extends State<JobSearchPage> {
  bool isWishedCompanies = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          // Top Banner
          Container(
            color: Colors.purple.shade100,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Career Scout',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // Toggle Button for Wished Companies and All Companies
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isWishedCompanies = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isWishedCompanies ? Colors.purple : Colors.white,
                      foregroundColor: isWishedCompanies
                          ? Colors.white
                          : Colors
                              .black, // Replace onPrimary with foregroundColor
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Wished Companies'),
                  ),
                ),

                
              ],
            ),
          ),
  
          // Job Vacancies List
          Expanded(
            child: ListView(
              children: [
                jobCard(
                    'Maybank', 'Salary • \$\$ • RM 4000', 'Web Developer', 5),
                jobCard(
                    'Lazada', 'Salary • \$\$ • RM 2000', 'Web Developer', 4),
                jobCard('Shopee', 'Salary • \$\$ • 3000', 'Web Developer', 5),
              ],
            ),
          ),

          // View More Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'View 20 Companies',
                style: TextStyle(color: Colors.purple),
              ),
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.purple),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple.shade50,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black54,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // Navigate to the CV Maker page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CvMakerPage()),
            );
          } else {
            // Handle other navigation based on index
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'CV Maker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Widget for a single job card
  Widget jobCard(String company, String salary, String role, int rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: Icon(
            Icons.business,
            size: 40,
            color: Colors.purple,
          ),
          title: Text(
            company,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(salary),
              Text(role),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  rating,
                  (index) => Icon(Icons.star, color: Colors.yellow, size: 16),
                ),
              ),
              Icon(Icons.favorite_border, color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}


class JobVacanciesPage extends StatefulWidget {
  @override
  _JobVacanciesPageState createState() => _JobVacanciesPageState();
}

class _JobVacanciesPageState extends State<JobVacanciesPage> {
  bool showAllCompanies = true;

  final List<Map<String, dynamic>> AllCompanies = [
    {'name': 'Maybank', 'salary': 'RM 4000', 'role': 'Web Developer', 'rating': 5},
    {'name': 'Lazada', 'salary': 'RM 2000', 'role': 'Web Developer', 'rating': 4},
    {'name': 'Shopee', 'salary': 'RM 3000', 'role': 'Web Developer', 'rating': 5},
    {'name': 'Bank Negara', 'salary': 'RM 3500', 'role': 'Web Developer', 'rating': 5},
    {'name': 'Coffe Bean', 'salary': 'RM 1000', 'role': 'Waiter', 'rating': 5},
    {'name': 'Lazada', 'salary': 'RM 2000', 'role': 'Designer', 'rating': 4},
    {'name': 'Bank Negara', 'salary': 'RM 5000', 'role': 'Finance Manager', 'rating': 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Career Scout'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ToggleButtons(
            borderRadius: BorderRadius.circular(20),
            isSelected: [showAllCompanies, !showAllCompanies],
            selectedColor: Colors.white,
            fillColor: Colors.purple,
            color: Colors.black,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("All Companies"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("All Companies"),
              ),
            ],
            onPressed: (index) {
              setState(() {
                showAllCompanies = index == 0;
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            'Job Vacancies',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: AllCompanies.length,
              itemBuilder: (context, index) {
                final company = AllCompanies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.business, color: Colors.purple),
                      title: Text(
                        company['name'],
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Salary: ${company['salary']}'),
                          Text(company['role']),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text('${company['rating']}'),
                          IconButton(
                            icon: Icon(Icons.favorite_border, color: Colors.purple),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: Text("View 20 Companies"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: 'CV Maker'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
