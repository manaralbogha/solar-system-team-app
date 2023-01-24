import 'package:flutter/material.dart';

import '../../../../models/model_product_for_company.dart';

import '../card_to_one_type_of_product_widget/card_to_one_type_of_product_widget.dart';

class ListViewToOneTypeOfProduct extends StatelessWidget {
  const ListViewToOneTypeOfProduct({super.key, required this.generalProducts});
  final List<CompanyProducts>? generalProducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: generalProducts!.length,
        itemBuilder: (context, index) {
          return CardToOneTypeOfProductWidget(
            generalProduct: generalProducts![index],
          );
        },
      ),
    );
  }
}
