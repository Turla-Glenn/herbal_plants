import 'package:flutter/material.dart';
import 'package:herbal_plants/data/plants.dart';
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
              Expanded(
                  child: ListView.builder(
                itemCount: herbalPlants.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    leading: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/${herbalPlants[index].commonName}.jpg'),
                        ),
                      ),
                    ),
                    title: TextWidget(
                      text: herbalPlants[index].commonName,
                      fontSize: 18,
                      fontFamily: 'Bold',
                    ),
                    children: [
                      TextWidget(
                        text:
                            'Scientific name: ${herbalPlants[index].scientificName}',
                        fontSize: 14,
                        fontFamily: 'Bold',
                        color: Colors.black,
                      ),
                      TextWidget(
                        text:
                            'Plant description: ${herbalPlants[index].description}',
                        fontSize: 12,
                        fontFamily: 'Regular',
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: 'Guides:  ${herbalPlants[index].plantingGuide}',
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
