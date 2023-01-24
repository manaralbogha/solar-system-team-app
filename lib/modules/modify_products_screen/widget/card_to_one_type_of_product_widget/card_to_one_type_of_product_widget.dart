import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/cubit.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';

import '../../../../models/model_product_for_company.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../../../../shared/const/const.dart';

class CardToOneTypeOfProductWidget extends StatelessWidget {
  const CardToOneTypeOfProductWidget({super.key, required this.generalProduct});
  final CompanyProducts generalProduct;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        return Card(
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                print(generalProduct.id);
                cubit.productChange(
                    idGeneralProduct: generalProduct.id,
                    companyProducts: generalProduct);
              },
              child: Row(
                //  crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Image.network(
                      endPointImage + generalProduct.image.toString(),
                      fit: BoxFit.cover,
                      // height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(generalProduct.features!.length,
                            (indexFeatures) {
                          return RowTextText(
                            name:
                                "${generalProduct.features![indexFeatures].name.toString()} : ",
                            number: generalProduct
                                .features![indexFeatures].value
                                .toString(),
                          );
                        }),
                      ),
                      RowTextText(
                        name: 'Price : ',
                        number: generalProduct.price.toString(),
                      ),
                      RowTextText(
                        name: 'Amount : ',
                        number: generalProduct.quantity.toString(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
