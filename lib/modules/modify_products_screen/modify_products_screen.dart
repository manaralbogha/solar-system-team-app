import 'package:flutter/material.dart';

import '../../models/model_get_order_by_id.dart';
import '../../shared/const/const.dart';

class ModifyProductsScreen extends StatelessWidget {
  const ModifyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<Products>? products = arg['products'];
    List<Widget> _locations = [
      // Container(
      //   height: 300,
      //   padding: EdgeInsets.all(10),
      //   child: Image.network(
      //     endPointImage + products![0].product!.image.toString(),
      //     fit: BoxFit.cover,
      //     height: 300,
      //     width: 200,
      //   ),
      // ),
      // Container(
      //   height: 300,
      //   padding: EdgeInsets.all(10),
      //   child: Image.network(
      //     endPointImage + products![0].product!.image.toString(),
      //     fit: BoxFit.cover,
      //     height: 300,
      //     width: 200,
      //   ),
      // ),
      // Container(
      //   height: 300,
      //   padding: EdgeInsets.all(10),
      //   child: Image.network(
      //     endPointImage + products![0].product!.image.toString(),
      //     fit: BoxFit.cover,
      //     height: 300,
      //     width: 200,
      //   ),
      // ),
      // Container(
      //   height: 300,
      //   padding: EdgeInsets.all(10),
      //   child: Image.network(
      //     endPointImage + products![0].product!.image.toString(),
      //     fit: BoxFit.cover,
      //     height: 300,
      //     width: 200,
      //   ),
      // ),
      // Container(
      //   height: 300,
      //   padding: EdgeInsets.all(10),
      //   child: Image.network(
      //     endPointImage + products![0].product!.image.toString(),
      //     fit: BoxFit.cover,
      //     height: 300,
      //     //    width: 200,
      //   ),
      // ),

      // SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Text('data'),
      //       Text('data'),
      //       Text('data'),
      //       Text('data'),
      //       Text('data'),
      //     ],
      //   ),
      // ),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
      // Text('data'),
    ]; // Option 2
    Widget? _selectedLocation;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 100,
          child: DropdownButton(
            menuMaxHeight: 600,

            hint:
                Text('Please choose a location'), // Not necessary for Option 1
            value: _selectedLocation,
            onChanged: (newValue) {
              // setState(() {
              _selectedLocation = newValue;
              // });
            },
            items: _locations.map((location) {
              return DropdownMenuItem(
                child: location,
                value: location,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
