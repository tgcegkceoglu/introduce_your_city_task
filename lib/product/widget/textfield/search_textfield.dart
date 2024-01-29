import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduce_your_city_task/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

class SearchTextField extends ConsumerWidget {
  final Null Function(dynamic value) onChanged;
  final TextEditingController controller;
  const SearchTextField({super.key,required this.onChanged,required this.controller});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      margin: context.padding.verticalNormal,
      height: context.sized.dynamicHeight(.055),
      child: TextField(
        onChanged: onChanged,
        style: context.general.textTheme.bodyLarge!.copyWith(
            color: ColorConstants.primaryColor,
            decoration: TextDecoration.none),
        decoration: InputDecoration(
          contentPadding: context.padding.horizontalNormal,
          isDense: true,
          prefixIcon: const Icon(
            Icons.search,
            color: ColorConstants.primaryColor,
          ),
          border:  OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorConstants.primaryColor,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(34),
          ),
          filled: true,
          fillColor: ColorConstants.grey,
        ),
      ),
    );
  }
}
