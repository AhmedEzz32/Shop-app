import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/layout/shop_app/cubit/cubit.dart';
import 'package:project1/layout/shop_app/cubit/states.dart';
import 'package:project1/models/shop_app/categories_model.dart';
import 'package:project1/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context ,state){},
      builder: (context , state){
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
              itemBuilder: (context ,index) =>
              builtCatItem(ShopCubit.get(context).categoriesModel!.data!.data![index]),
          separatorBuilder: (context ,index) => const MyDivider(),
          itemCount: ShopCubit.get(context).categoriesModel!.data!.data!.length,
        );
      },
    );
  }

  Widget builtCatItem(DataModel model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:  [
        Image(
          image: NetworkImage(
            model.image!,
          ),
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 20,

        ),
        Text(
          model.name!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    ),
  );
}
