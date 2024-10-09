import 'package:flutter/material.dart';
import 'package:herbal_plants/widgets/text_widget.dart';

class CropDetailsPage extends StatelessWidget {
  Map data;

  CropDetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        title: TextWidget(
          text: 'Crop D Tech',
          fontSize: 18,
          fontFamily: 'Bold',
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/${data['name'].toString().toLowerCase()}.PNG'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Crop Name: ${data['name']}',
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'Scientific Name',
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Medium',
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: TextWidget(
                  text: data['scientificName'],
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'Regular',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'Description',
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Medium',
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: TextWidget(
                  text: data['description'],
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'Regular',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'Climate',
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Medium',
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: TextWidget(
                  text: data['climate'],
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'Regular',
                ),
              ),
              const SizedBox(
                height: 50,
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
