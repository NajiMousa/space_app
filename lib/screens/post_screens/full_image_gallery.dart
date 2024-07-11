import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FullImageGallery extends StatelessWidget {
  final List<dynamic> imageUrls;

  FullImageGallery({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Gallery')),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            child: Container(

              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp)),
              child: CachedNetworkImage(
                imageUrl: imageUrls[index],
                fit: BoxFit.cover,
                progressIndicatorBuilder:
                    (context, url, downloadProgress) =>
                    Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        enabled: true,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.sp)),
                        )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),

          );
        },
      ),
    );
  }
}