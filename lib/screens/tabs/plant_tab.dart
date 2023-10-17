import 'package:flutter/material.dart';
import 'package:herbal_plants/widgets/text_widget.dart';

class PlantTab extends StatelessWidget {
  const PlantTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: SizedBox(
        child: ListView.separated(
          itemCount: 50,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                width: 75,
                height: 75,
                color: Colors.black,
              ),
              title: TextWidget(
                text: 'Name of plant here',
                fontSize: 18,
                fontFamily: 'Bold',
              ),
              subtitle: TextWidget(
                text: 'Description of plant here',
                fontSize: 12,
                fontFamily: 'Regular',
              ),
            );
          },
        ),
      ),
    );
  }
}
