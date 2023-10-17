import 'package:flutter/material.dart';
import 'package:herbal_plants/widgets/text_widget.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: SizedBox(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Plant Guides',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: ListView.builder(
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    leading: Container(
                      width: 50,
                      height: 50,
                      color: Colors.black,
                    ),
                    title: TextWidget(
                      text: 'Plant name here',
                      fontSize: 18,
                      fontFamily: 'Bold',
                    ),
                    children: [
                      TextWidget(
                        text: 'Scientific name: Lorem Ipsum',
                        fontSize: 14,
                        fontFamily: 'Bold',
                        color: Colors.black,
                      ),
                      TextWidget(
                        text:
                            'Plant description: Nisi magna voluptate est voluptate nisi aliquip laboris voluptate labore irure.',
                        fontSize: 12,
                        fontFamily: 'Regular',
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text:
                            'Guides:  Nisi magna voluptate est voluptate nisi aliquip laboris voluptate labore irure.',
                        fontSize: 12,
                        fontFamily: 'Regular',
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              )),
            ]),
      ),
    );
  }
}
