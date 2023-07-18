import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("about",style: GoogleFonts.poppins(color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("This is Interior",style: GoogleFonts.poppins(letterSpacing: 1,color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.w500)),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Interior Design is a global leader in life at home. Founded in Sweden in 1943, IKEA is now a worldwide retailer of affordable, well-designed products and solutions for every room in your home. Our values and optimism are shared with millions of co-workers and customers around the world. Along with our desire to champion sustainable living, responsible sourcing, and communities in need of support.",
                style: GoogleFonts.poppins(color: Colors.black,wordSpacing: 2,letterSpacing: 1),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
