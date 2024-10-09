List<Map<String, dynamic>> crops = [
  {
    'name': 'Corn',
    'scientificName': 'Zea mays',
    'description':
        'Corn is a cereal plant that produces kernels on large ears. It is widely grown as a food and fodder crop.',
    'climate':
        'Warm season crop, grows best in temperatures between 60°F to 95°F (15°C to 35°C).',
    'soilType': 'Well-drained, fertile loamy soils with a pH of 5.8 to 7.0.',
    'waterRequirement':
        'Requires about 1 inch of water per week during the growing season.',
    'harvestTime': '70 to 100 days after planting, depending on the variety.'
  },
  {
    'name': 'Rice',
    'scientificName': 'Oryza sativa',
    'description':
        'Rice is a staple food for over half the world’s population. It is cultivated in flooded fields called paddies.',
    'climate':
        'Grows in tropical and subtropical climates. Requires a warm, humid climate with temperatures between 70°F to 95°F (21°C to 35°C).',
    'soilType': 'Grows best in clay or loamy soils that can retain water.',
    'waterRequirement':
        'Requires a large amount of water during cultivation, typically through flooded fields.',
    'harvestTime': '3 to 6 months depending on the variety and the climate.'
  },
  {
    'name': 'Watermelon',
    'scientificName': 'Citrullus lanatus',
    'description':
        'Watermelon is a vine-like flowering plant that produces large, sweet fruits with a hard rind and juicy flesh.',
    'climate':
        'Warm-season crop that grows best in temperatures between 70°F to 85°F (21°C to 29°C).',
    'soilType':
        'Prefers sandy loam soils with a pH of 6.0 to 7.5 and good drainage.',
    'waterRequirement':
        'Requires consistent moisture, especially when fruits are developing, but avoids waterlogging.',
    'harvestTime': '80 to 90 days after planting, depending on the variety.'
  }
];

List<Map<String, dynamic>> riceDiseases = [
  {
    'name': 'Bacterial Leaf Blight',
    'description':
        'A bacterial disease caused by Xanthomonas oryzae that affects the leaves of rice, causing wilting and yellowing.',
    'prevention':
        'Use resistant varieties, ensure proper field drainage, and avoid excessive use of nitrogen fertilizers.'
  },
  {
    'name': 'Brown Spot',
    'description':
        'A fungal disease caused by Bipolaris oryzae, resulting in brown lesions on leaves, leading to poor grain filling.',
    'prevention':
        'Apply balanced fertilizers, improve drainage, and use fungicide treatments when necessary.'
  },
  {
    'name': 'Leaf Smut',
    'description':
        'A fungal disease caused by Entyloma oryzae, which causes black or grayish lesions on leaves, reducing photosynthesis.',
    'prevention':
        'Use resistant varieties, apply fungicides, and practice good field hygiene to prevent spread.'
  }
];

List<Map<String, dynamic>> cornDiseases = [
  {
    'name': 'Blight',
    'description':
        'A fungal disease caused by Bipolaris maydis or other pathogens, leading to the development of large brown spots on the leaves and reducing crop yields.',
    'prevention':
        'Use resistant varieties, practice crop rotation, and avoid planting corn in infected fields for a few years.'
  },
  {
    'name': 'Common Rust',
    'description':
        'A fungal disease caused by Puccinia sorghi, characterized by small, reddish-brown pustules on both sides of the leaves.',
    'prevention':
        'Plant rust-resistant corn varieties, apply fungicides, and avoid dense plantings to reduce humidity.'
  },
  {
    'name': 'Gray Leaf Spot',
    'description':
        'A fungal disease caused by Cercospora zeae-maydis, resulting in rectangular, gray to tan lesions on leaves.',
    'prevention':
        'Plant resistant hybrids, practice crop rotation, and remove plant debris from fields to reduce the source of infection.'
  },
  {
    'name': 'Healthy',
    'description': 'No disease present; the crop is healthy and thriving.',
    'prevention':
        'Continue best practices in crop management, including proper watering, nutrient balance, and disease prevention methods.'
  }
];
List<Map<String, dynamic>> watermelonDiseases = [
  {
    'name': 'Anthracnose',
    'description':
        'A fungal disease caused by Colletotrichum orbiculare, resulting in dark, sunken lesions on leaves, stems, and fruits.',
    'prevention':
        'Use disease-free seeds, apply fungicides, rotate crops, and avoid overhead irrigation to reduce moisture on leaves.'
  },
  {
    'name': 'Downy Mildew',
    'description':
        'A fungal disease caused by Pseudoperonospora cubensis, causing yellow patches on leaves that turn brown and die.',
    'prevention':
        'Use resistant varieties, apply fungicides, and avoid planting in areas with poor air circulation or excess moisture.'
  },
  {
    'name': 'Mosaic Virus',
    'description':
        'A viral disease that causes yellow mottling and distortion of leaves, leading to stunted growth and deformed fruits.',
    'prevention':
        'Use virus-free seeds, control insect vectors (such as aphids), and remove infected plants immediately.'
  },
  {
    'name': 'Healthy',
    'description': 'No disease present; the crop is healthy and growing well.',
    'prevention':
        'Maintain regular monitoring and use good agricultural practices to keep the crop healthy.'
  }
];
