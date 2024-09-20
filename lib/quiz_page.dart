import 'package:flutter/material.dart';
import 'result.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Question> _questions = [
    Question(
      shadowImage: 'assets/shadow1.png',
      correctOptionImage: 'assets/image1.png',
      options: [
        {'image': 'assets/image1.png', 'value': 'A'},
        {'image': 'assets/image2.png', 'value': 'B'},
        {'image': 'assets/image3.png', 'value': 'C'},
        {'image': 'assets/image4.png', 'value': 'D'}
      ],
    ),
    Question(
      shadowImage: 'assets/shadow2.png',
      correctOptionImage: 'assets/image6.png',
      options: [
        {'image': 'assets/image5.png', 'value': 'A'},
        {'image': 'assets/image6.png', 'value': 'B'},
        {'image': 'assets/image7.png', 'value': 'C'},
        {'image': 'assets/image8.png', 'value': 'D'}
      ],
    ),
    Question(
      shadowImage: 'assets/shadow3.png',
      correctOptionImage: 'assets/image9.png',
      options: [
        {'image': 'assets/image9.png', 'value': 'A'},
        {'image': 'assets/image10.png', 'value': 'B'},
        {'image': 'assets/image11.png', 'value': 'C'},
        {'image': 'assets/image12.png', 'value': 'D'}
      ],
    ),
    Question(
      shadowImage: 'assets/shadow4.png',
      correctOptionImage: 'assets/image13.png',
      options: [
        {'image': 'assets/image13.png', 'value': 'A'},
        {'image': 'assets/image14.png', 'value': 'B'},
        {'image': 'assets/image15.png', 'value': 'C'},
        {'image': 'assets/image16.png', 'value': 'D'}
      ],
    ),
    Question(
      shadowImage: 'assets/shadow5.png',
      correctOptionImage: 'assets/image18.png',
      options: [
        {'image': 'assets/image17.png', 'value': 'A'},
        {'image': 'assets/image18.png', 'value': 'B'},
        {'image': 'assets/image19.png', 'value': 'C'},
        {'image': 'assets/image20.png', 'value': 'D'}
      ],
    ),
  ];

  void _answerQuestion(String imagePath) {
    setState(() {
      if (imagePath == _questions[_currentQuestionIndex].correctOptionImage) {
        _score += 1;
      }
      _currentQuestionIndex += 1;
    });

    if (_currentQuestionIndex >= _questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage(score: _score)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Guess the Image',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Bold title
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // White back arrow
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Navigate to profile page or handle profile action
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(210, 88, 112, 228), // First color
                Color.fromARGB(255, 195, 19, 208)  // Second color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: _currentQuestionIndex < _questions.length
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20), // Added space before the question image
                  Container(
                    width: 100, // Reduced width
                    height: 100, // Reduced height
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        _questions[_currentQuestionIndex].shadowImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 30), // Spacing between question and options
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.0, // Ensures square images
                      ),
                      itemCount: _questions[_currentQuestionIndex].options.length,
                      itemBuilder: (context, index) {
                        final option = _questions[_currentQuestionIndex].options[index];
                        return GestureDetector(
                          onTap: () => _answerQuestion(option['image']!),
                          child: Container(
                            width: 40, // Further reduced size
                            height: 40, // Further reduced size
                            child: Image.asset(
                              option['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz Completed!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Your score is $_score/${_questions.length}',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      _getFeedback(),
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back to Home'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  String _getFeedback() {
    if (_score == _questions.length) {
      return 'Excellent work! You seem to have strong visual and spatial skills.';
    } else if (_score > _questions.length / 2) {
      return 'Good job! You have a good grasp of visual patterns.';
    } else {
      return 'Keep practicing! Working on visual and spatial reasoning can help improve your skills.';
    }
  }
}

class Question {
  final String shadowImage;
  final String correctOptionImage;
  final List<Map<String, String>> options;

  Question({
    required this.shadowImage,
    required this.correctOptionImage,
    required this.options,
  });
}