import 'package:flutter/material.dart';
import '../components/back_button.dart'; // Import the BackButtonWidget
import '../constants.dart'; // Import the constants file
import '../services/dictionary_service.dart'; // Import DictionaryService
import '../components/loading_widget.dart'; // Import LoadingWidget

class WordSearchPage extends StatefulWidget {
  @override
  _WordSearchPageState createState() => _WordSearchPageState();
}

class _WordSearchPageState extends State<WordSearchPage> {
  final TextEditingController _controller = TextEditingController();
  String? _definition;
  String? _pronunciation;
  bool _isLoading = false;

  void fetchWord(String word) async {
    setState(() {
      _isLoading = true;
      _definition = null;
      _pronunciation = null;
    });

    try {
      DictionaryService dictionaryService = DictionaryService(word);
      final wordData = await dictionaryService.fetchWordData();

      setState(() {
        _isLoading = false;
        if (wordData != null) {
          _definition = wordData['definition'];
          _pronunciation = wordData['pronunciation'];
        } else {
          _definition = 'No data found for the word.';
        }
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _definition = 'An error occurred: $error';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        backgroundColor: kAppBarBackground,
        elevation: 5.0,
      ),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/base 3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter a word',
                  style: kMainTitleTextStyle,
                ),
                const SizedBox(height: 20),
                // Input Field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Search Button
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      fetchWord(_controller.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kYellow,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 40.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Loading Indicator
                if (_isLoading) LoadingWidget(),
                // Result Display
                if (_definition != null || _pronunciation != null)
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: kYellow,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_definition != null)
                          Text(
                            "Definition: $_definition",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        const SizedBox(height: 10),
                        if (_pronunciation != null)
                          Text(
                            "Pronunciation: $_pronunciation",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
