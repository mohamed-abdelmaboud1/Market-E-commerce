
import 'package:flutter/material.dart';

import '../../../../../core/utils/image_pathes.dart';

Widget categoryImage(String nameOfCategory) {
  String imagePath;
  if (nameOfCategory == "electronics") {
    imagePath = ImagePathes.product2;
  } else if (nameOfCategory == "fashion") {
    imagePath = ImagePathes.fashonImagePath;
  } else if (nameOfCategory == "food") {
    imagePath = ImagePathes.foodImagePath;
  } else if (nameOfCategory == "pampers") {
    imagePath = ImagePathes.pampersImagePath;
  } else if (nameOfCategory == "pc") {
    imagePath = ImagePathes.pcImagePath;
  } else if (nameOfCategory == "phone") {
    imagePath = ImagePathes.phoneImagePath;
  } else if (nameOfCategory == "plant") {
    imagePath = ImagePathes.plantImagePath;
  } else if (nameOfCategory == "adidas") {
    imagePath = ImagePathes.adidasImagePath;
  } else if (nameOfCategory == "apple") {
    imagePath = ImagePathes.appleImagePath;
  } else if (nameOfCategory == "canon") {
    imagePath = ImagePathes.canonImagePath;
  } else if (nameOfCategory == "jbl") {
    imagePath = ImagePathes.jblImagePath;
  } else if (nameOfCategory == "lacoste") {
    imagePath = ImagePathes.fashonImagePath;
  }else if (nameOfCategory == "toshiba") {
    imagePath = ImagePathes.smartTvImagePath;
  } else {
    return const Icon(Icons.broken_image);
  }

  return Image.asset(
    imagePath,
    fit: BoxFit.cover,
  );
}
