import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trilochanaa_app/views/widget/visitor_card.dart';

class VisitorShimmer extends StatefulWidget {
  VisitorShimmer({Key? key}) : super(key: key);

  @override
  State<VisitorShimmer> createState() => _VisitorShimmerState();
}

class _VisitorShimmerState extends State<VisitorShimmer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //Note: API ready hole ListView.spereted use korte hobe
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[400]!,
          child: VisitorCard(
            image: '',
            name: '',
            id: '',
            visitorID: '',
            status: '',
            statusName: '',
            checkInAt: '',
            checkOutAt: '',
          ),
        );
      },
    );
  }
}
