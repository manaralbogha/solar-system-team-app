import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/cubit.dart';
import 'package:solar_system_team/layout/home_solar_system_team_screen/cubit/states.dart';

import '../../../../models/model_get_order_by_id.dart';
import '../../../../shared/components/row_text_text_widget.dart';
import '../../../../shared/const/const.dart';
import '../list_view_to_one_type_of_product_widget/list_view_to_one_type_of_product_widget.dart';

class CardModifyProductWidget extends StatelessWidget {
  const CardModifyProductWidget({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeSolarSystemTeamCubit, HomeSolarSystemTeamStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeSolarSystemTeamCubit.get(context);
        return Card(
          margin: const EdgeInsets.all(8),
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
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        endPointImage + product.product!.image.toString(),
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
                          children:
                              List.generate(product.product!.features!.length,
                                  (indexFeatures) {
                            return RowTextText(
                              name:
                                  "${product.product!.features![indexFeatures].name.toString()} : ",
                              number: product
                                  .product!.features![indexFeatures].value
                                  .toString(),
                            );
                          }),
                        ),
                        RowTextText(
                          name: 'Price : ',
                          number: product.product!.price.toString(),
                        ),
                        // RowTextText(
                        //   name: 'Amount : ',
                        //   number: product.productAmmount.toString(),
                        // )
                        Container(
                          height: 30,
                          // width: double.infinity,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Amount : ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 168, 168, 10),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 30,
                              // ),
                              InkWell(
                                  onTap: () {
                                    cubit.minusAmount(product);
                                  },
                                  child: const Icon(Icons.arrow_left)),

                              Text(
                                product.productAmmount.toString(),
                                style: TextStyle(
                                  fontSize: product.productAmmount < 10
                                      ? 20
                                      : product.productAmmount < 100
                                          ? 15
                                          : 10,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    cubit.addAmount(product);
                                  },
                                  child: const Icon(Icons.arrow_right)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          cubit.deleteProductsFromOrder(product);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                ),
                if (product.product!.showProducts == true)
                  const SizedBox(
                    height: 20,
                  ),
                Builder(builder: (context) {
                  if (product.product!.showProducts == true) {
                    if (product.product!.categore!.id == 2) {
                      return ListViewToOneTypeOfProduct(
                        generalProducts: cubit.panel,
                      );
                    }
                    if (product.product!.categore!.id == 3) {
                      return ListViewToOneTypeOfProduct(
                        generalProducts: cubit.inverter,
                      );
                    }
                    if (product.product!.categore!.id == 4) {
                      return ListViewToOneTypeOfProduct(
                        generalProducts: cubit.batter,
                      );
                    }
                    if (product.product!.categore!.id == 5) {
                      return ListViewToOneTypeOfProduct(
                        generalProducts: cubit.generator,
                      );
                    }
                    return const Text('data');
                  } else {
                    return const SizedBox();
                  }
                }),
                TextButton(
                  onPressed: () {
                    cubit.showProductForChange(product);
                    // products[index].product!.showProducts =
                    //     (products[index].product!.showProducts);
                    // print(products[index].product!.showProducts);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Edit',
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(product.product!.showProducts == false
                          ? Icons.arrow_circle_down
                          : Icons.arrow_circle_up),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
