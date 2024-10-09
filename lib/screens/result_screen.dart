import 'dart:io';

import 'package:flutter/material.dart';
import 'package:herbal_plants/data/values.dart';
import 'package:herbal_plants/screens/home_page.dart';
import 'package:herbal_plants/widgets/button_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/text_widget.dart';

class ResultScreen extends StatefulWidget {
  File file;
  int index;

  ResultScreen({
    super.key,
    required this.file,
    required this.index,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        title: TextWidget(
          text: 'Result',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(widget.file), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextWidget(
                  text: 'Result: ${values[widget.index]['name']}',
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Bold',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Description:',
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'Medium',
                    ),
                    TextWidget(
                      text: ' ${values[widget.index]['description']}',
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: 'Regular',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Prevention:',
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'Medium',
                    ),
                    TextWidget(
                      text: '${values[widget.index]['prevention']}',
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: 'Regular',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ButtonWidget(
                  color: Colors.green,
                  radius: 20,
                  height: 75,
                  label: 'Back to Home',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
