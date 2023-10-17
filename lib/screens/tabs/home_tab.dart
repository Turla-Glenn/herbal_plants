import 'package:flutter/material.dart';
import 'package:herbal_plants/widgets/text_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Recently Scanned Plant:',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: TextWidget(
                    text: 'Insert Image here',
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Bold',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Recommended',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.black,
                            width: 500,
                            height: 125,
                            child: Center(
                              child: TextWidget(
                                text: 'Insert Image here',
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Bold',
                              ),
                            ),
                          ),
                          TextWidget(
                            text: 'Name of Plant',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
