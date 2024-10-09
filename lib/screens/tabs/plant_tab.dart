import 'package:flutter/material.dart';
import 'package:herbal_plants/data/newdata.dart';
import 'package:herbal_plants/data/plants.dart';
import 'package:herbal_plants/widgets/text_widget.dart';

class PlantTab extends StatelessWidget {
  const PlantTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: list1(context, cornDiseases, 'corn', 'Corn'),
            ),
            Column(
              children: list1(context, riceDiseases, 'rice', 'Rice'),
            ),
            Column(
              children: list1(
                  context, watermelonDiseases, 'watermelon', 'Watermelon'),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> list1(context, List disease, String img, String type) {
    return [
      for (int i = 0; i < disease.length; i++)
        ListTile(
          leading: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/$img.PNG'),
                                ),
                              ),
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              text: disease[i]['name'],
                              fontSize: 24,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              text:
                                  'Disease description: ${disease[i]['description']}',
                              fontSize: 14,
                              fontFamily: 'Regular',
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              text: 'Prevention:  ${disease[i]['prevention']}',
                              fontSize: 14,
                              fontFamily: 'Regular',
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/$img.PNG'),
                ),
              ),
            ),
          ),
          title: TextWidget(
            text: disease[i]['name'] + ' ($type)',
            fontSize: 18,
            fontFamily: 'Bold',
          ),
          subtitle: TextWidget(
            text: disease[i]['description'],
            fontSize: 12,
            fontFamily: 'Regular',
          ),
        )
    ];
  }
}
