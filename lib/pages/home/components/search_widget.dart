import 'package:discover_majalengka/helpers/constants.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.all(6),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              decoration: const BoxDecoration(
                color: taelColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
            suffixIcon: const Icon(
              Icons.sort,
              color: Colors.black26,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            hintText: "Ketik tempat yang dicari...",
            hintStyle: const TextStyle(color: taelColor, fontSize: 15),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14)),
      ),
    );
  }
}
