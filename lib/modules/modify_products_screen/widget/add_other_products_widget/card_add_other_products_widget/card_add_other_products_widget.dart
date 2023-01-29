import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/cubit.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';

import '../../../../../models/model_get_order_by_id.dart';
import '../../../../../shared/components/row_text_text_widget.dart';
import '../../../../../shared/const/const.dart';

class CardAddOtherProductWidget extends StatelessWidget {
  const CardAddOtherProductWidget(
      {super.key, required this.productCompany, required this.products});
  final Product productCompany;
  final List<Products> products;

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
                products.add(Products(
                    productAmmount: 1,
                    id: productCompany.id,
                    product: productCompany));
                cubit.addOtherProduct();
                // products.where((element) {
                //   print(element.product!.categore!.id);
                //   print(
                //       cubit.allProductCompany[index].categore!.id);

                //   element.product!.categore!.id ==
                //       cubit.allProductCompany[index].categore!.id;
                // products.add(Products(
                //     productAmmount: 1,
                //     id: cubit.allProductCompany[index].id,
                //     product: cubit.allProductCompany[index]));
                // cubit.addOtherProduct();
                //   return true;
                // });
                // print('object');
              },
              child: Row(
                //  crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Image.network(
                      endPointImage + productCompany.image.toString(),
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
                        children: List.generate(productCompany.features!.length,
                            (indexFeatures) {
                          return RowTextText(
                            name:
                                "${productCompany.features![indexFeatures].name.toString()} : ",
                            number: productCompany
                                .features![indexFeatures].value
                                .toString(),
                          );
                        }),
                      ),
                      RowTextText(
                        name: 'Price : ',
                        number: productCompany.price.toString(),
                      ),
                      RowTextText(
                        name: 'Amount : ',
                        number: productCompany.quantity.toString(),
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
