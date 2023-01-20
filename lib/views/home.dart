import "package:flutter/material.dart";
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:torismo/style/style.dart';
import 'package:google_fonts/google_fonts.dart';
import  'detail.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      "letsgo",
      "chicago",
      "maison",
      "parc",
      "tobogan",
      "vue_degagé_montage"
    ];
    String image = "vue_degagé_montage";

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * .35,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: ()=>Get.to(DetailPage(title: imageList[index])),
                        child: ImageWidget(
                            height: height,
                            width: width,
                            image: imageList[index]));
                  }),
            ),
            TextWidget(),
            const SizedBox(
              height: 5,
            ),
            GridWidget(imageList: imageList)
          ],
        ),
      ),
    ),

    );
  }
}


class GridWidget extends StatelessWidget {
  const GridWidget({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    String image = "vue_degagé_montage";

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 20,
      shrinkWrap: true,
      children: List.generate(imageList.length, (index) {
        return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                    AssetImage("assets/${imageList[index]}.jpeg"),
                    fit: BoxFit.cover),
                borderRadius:
                BorderRadius.circular(containerRoundCorner)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    image,
                    style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.star, color: amberColor, size: 10),
                      Icon(Icons.star, color: amberColor, size: 10),
                      Icon(Icons.star, color: amberColor, size: 10),
                      Icon(Icons.star, color: amberColor, size: 10),
                      Icon(Icons.star, color: amberColor, size: 10),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "4.5",
                        style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  trailing: CircleAvatar(
                    radius: 10,
                    backgroundColor: whiteColor,
                    child: const Icon(Icons.favorite,
                        color: Colors.red, size: 15),
                  ),
                )
              ],
            ));
      }),
    );
  }
}





class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Recomanded",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
        Text("View All", style: subTitleTextStyle()),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget(
      {Key? key,
      required this.height,
      //required this.imageList,
      required this.width,
      required this.image})
      : super(key: key);

  final double height;
  // final List<String> imageList;
  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        height: height * .3,
        width: width * .7,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/${image}.jpeg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(containerRoundCorner)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                image,
                style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.star, color: amberColor, size: 15),
                  Icon(Icons.star, color: amberColor, size: 15),
                  Icon(Icons.star, color: amberColor, size: 15),
                  Icon(Icons.star, color: amberColor, size: 15),
                  Icon(Icons.star, color: amberColor, size: 15),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "4.5",
                    style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              trailing: CircleAvatar(
                radius: 15,
                backgroundColor: whiteColor,
                child: const Icon(
                    Icons.favorite,
                    color: Colors.red, size: 25
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
