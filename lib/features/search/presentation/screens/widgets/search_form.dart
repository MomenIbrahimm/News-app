import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/features/search/presentation/logic/search_cubit.dart';

import '../../../../../core/theming/color_manger.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        onChanged: (value) {
          context.read<SearchCubit>().getSearchData(text: value);
        },
        style: const TextStyle(
          fontSize: 14.0,
          color: ColorManger.black,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: ColorManger.black),
          filled: true,
          fillColor: ColorManger.white,
          suffixIcon:
              const Icon(Ionicons.search_outline, color: ColorManger.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: ColorManger.primaryColor),
          ),
        ),
      ),
    );
  }
}
