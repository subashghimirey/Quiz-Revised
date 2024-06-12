import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.nextPage});

  final void Function() nextPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 224, 224),
      appBar: AppBar(
        title: const Text(
          'Quiz Application',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset('assets/images/front-page-image.png'),
          const Text("Play Quiz and Earn Money"),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: nextPage,
            label: const Text("Play Quiz"),
            icon: const Icon(Icons.favorite),
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 14, 171, 95),
                foregroundColor: Colors.white,
                iconColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 19)),
          ),
        ],
      ),
    );
  }
}
