import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerlisttile() {
  return Column(
    children: [
      SizedBox(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.white,
          child: ListTile(
            leading: Container(
              color: Colors.grey.shade300,
              height: 60,
              width: 60,
            ),
            title: Column(
              children: [
                Container(
                  height: 40,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            subtitle: Container(
              height: 50,
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
      const Divider()
    ],
  );
}
