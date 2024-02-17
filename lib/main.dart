import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 24, 40, 75),
        body: PortfolioPage(),
      ),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(
        context.responsive<double>(
          20, // default
          sm: 10, // small 
          md: 20, // medium
          lg: 30, // large 
          xl: 50, // extra large screen
        ),
      ),
      children: <Widget>[
        TitlePage(),
        // Each child represents a page in the portfolio
        ExperiencePage(),

        ContactsPage(),
        // Add more PortfolioItem widgets for additional projects
      ],
    );
  }
}


class TitlePage extends StatelessWidget{
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: 1.0,
            child: RichText(
              text: TextSpan(
                text: "hi,",
                style: TextStyle(
                  fontFamily: "Aileron", 
                  fontWeight: FontWeight.w400, 
                  fontSize: context.responsive<double>(
                    72, // default
                    sm: 50, // small 
                    md: 72, // medium
                    lg: 86, // large 
                    xl: 100, // extra large screen
                  ), 
                  color: Color.fromARGB(255, 248, 238, 224)),
                children: <TextSpan>[
                  TextSpan(
                      text: ' nice to meet you. I\'m',
                      style: TextStyle(
                        fontFamily: "Aileron",
                        fontWeight: FontWeight.w200,
                        fontSize: context.responsive<double>(
                          72, // default
                          sm: 50, // small 
                          md: 72, // medium
                          lg: 86, // large 
                          xl: 100, // extra large screen
                        ), 
                        color: Color.fromARGB(255, 248, 238, 224))
                  ),
                ]
              )
            ),
          ),
          Text(
            textAlign: TextAlign.left,
            style: TextStyle(fontFamily: "Aileron", 
            fontWeight: FontWeight.w800, 
            fontSize: context.responsive<double>(
              86, // default
              sm: 72, // small 
              md: 86, // medium
              lg: 100, // large 
              xl: 132, // extra large screen, 
            ),
            color: Color.fromARGB(255, 248, 238, 224)),
            "Christopher",
          ),
          const Padding(
              padding: EdgeInsets.only(top: 40.0),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              color:Color.fromARGB(255, 252, 103, 54), // Pink background
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(10), // Adjust margin as needed
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 176, 176), // Orange background
                  // borderRadius: BorderRadius.circular(10), // Optional: rounded corners
                ),
                child: Image.asset(
                  'assets/self.png', // Replace with your image URL
                  width: context.responsive<double>(
                    400, // default
                    sm: 200, // small 
                    md: 400, // medium
                    lg: 600, // large 
                    xl: 800, // extra large screen
                  ), // Adjust width as needed
                  height: context.responsive<double>(
                    400, // default
                    sm: 200, // small 
                    md: 400, // medium
                    lg: 600, // large 
                    xl: 800, // extra large screen
                  ), // Adjust height as needed
                  fit: BoxFit.cover, // Adjust image fitting as needed
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40.0),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: context.responsive<double>(
                600, // default
                sm: 400, // small 
                md: 600, // medium
                lg: 900, // large 
                xl: 1200, // extra large screen
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  textAlign: TextAlign.left,
                  "I'm a software developer.",
                  style: TextStyle(
                    fontFamily: "Aileron", 
                    fontWeight: FontWeight.w200, 
                    fontSize: context.responsive<double>(
                      50, // default
                      sm: 36, // small 
                      md: 50, // medium
                      lg: 72, // large 
                      xl: 86, // extra large screen
                    ), 
                    color: Color.fromARGB(255, 248, 238, 224)),
                  ),
                  Text(
                    textAlign: TextAlign.left,
                    "I love to build meaningful projects.",
                    style: TextStyle(
                    fontFamily: "Aileron", 
                    fontWeight: FontWeight.w200, 
                    fontSize: context.responsive<double>(
                      50, // default
                      sm: 36, // small 
                      md: 50, // medium
                      lg: 72, // large 
                      xl: 86, // extra large screen
                    ), 
                    color: Color.fromARGB(255, 248, 238, 224)),
                  ),
                ],
              )
            ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.responsive<double>(
                100, // default
                sm: 50, // small 
                md: 100, // medium
                lg: 200, // large 
                xl: 300, // extra large screen
              )
            ),
          ) 
        ],
      )
    );
  }
}

class ExperiencePage extends StatelessWidget{
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          "Experience",
          style: TextStyle(
            fontFamily: "Aileron", 
            fontWeight: FontWeight.w800, 
            fontSize: context.responsive<double>(
              72, // default
              sm: 50, // small 
              md: 72, // medium
              lg: 86, // large 
              xl: 100, // extra large screen
            ), 
            color: Color.fromARGB(255, 248, 238, 224)),
        ),
        Padding(
          padding: EdgeInsets.only(top: context.responsive<double>(
              30, // default
              sm: 20, // small 
              md: 30, // medium
              lg: 40, // large 
              xl: 50, // extra large screen
          )),
        ),
        ExperienceItem(
          logoAssetPath: 'assets/LMI_logo.jpg',
          positionName: 'Software Engineer Co-op',
          companyName: 'LMI Technologies',
          bulletPoints: [
            'Developed and maintained features for the company Automated Test Framework API in Python.',
            'Integrated KPIs and logging into the sensor stability test engine which identified a memory leak and enhanced performance monitoring.',
            'Wrote 60+ automated regression and stability tests spanning multiple sensor product lines covering core features.',
            'Developed an interface for Firmware‑level APIs into the ATF using ctypes, enabling team to access lower‑level sensor information.',
            'Implemented a commit visualization tool using Bamboo API to visualize commits from different teams, as well as performance information.',
            'Created a test coverage tracking tool, used by team members to monitor manual and automated tests, and identify areas for enhanced coverage.',
          ],
        ),
        ExperienceItem(
          logoAssetPath: 'assets/SFU_logo.jpg',
          positionName: 'Undergraduate Reasearch Assistant',
          companyName: 'Simon Fraser University Faculty of Applied Science',
          bulletPoints: [
            "Optimized UART transmission via BLE on multiple NRF52840 development boards connected together using Python and CircuitPython",
            "Utilized C to optimize firmware, achieving 5‑10x program speed up and improved data throughput and connection consistency.",
            "Implemented program in C on Raspberry Pi Pico to communicate with AD7768‑1 ADC through SPI.",
            "Created PCB footprints using KiCAD to create a custom external ADC board for antenna data acquisition.",
          ],
        )
      ],
    );
  }
}

class ExperienceItem extends StatelessWidget {
  final String logoAssetPath;
  final String positionName;
  final String companyName;
  final List<String> bulletPoints;

  const ExperienceItem({
    Key? key,
    required this.logoAssetPath,
    required this.positionName,
    required this.companyName,
    required this.bulletPoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsive<double>(
        500, // default
        sm: 450, // small 
        md: 500, // medium
        lg: 550, // large 
        xl: 600, // extra large screen
      ),
      width: context.responsive<double>(
        1024, // default
        sm: 768, // small 
        md: 1024, // medium
        lg: 1920, // large 
        xl: 2160, // extra large screen
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color.fromARGB(255, 252, 103, 54), // Pink background
            padding: EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(10), // Adjust margin as needed
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 176, 176), // Orange background
                // borderRadius: BorderRadius.circular(10), // Optional: rounded corners
              ),
              child: Image.asset(
                logoAssetPath,
                width: context.responsive<double>(
                  200, // default
                  sm: 100, // small 
                  md: 200, // medium
                  lg: 250, // large 
                  xl: 300, // extra large screen
                ), // Adjust width as needed
                height: context.responsive<double>(
                  200, // default
                  sm: 100, // small 
                  md: 200, // medium
                  lg: 250, // large 
                  xl: 300, // extra large screen
                ), // Adjust height as needed
                fit: BoxFit.cover, // Adjust image fitting as needed
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.responsive<double>(
                30, // default
                sm: 20, // small 
                md: 30, // medium
                lg: 40, // large 
                xl: 50, // extra large screen
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: context.responsive<double>(             
                750, // default
                sm: 550, // small 
                md: 750, // medium
                lg: 950, // large 
                xl: 1200, // extra large screen
              ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: positionName,
                    style: TextStyle(
                      fontFamily: "Aileron",
                      fontWeight: FontWeight.w600,
                      fontSize: context.responsive<double>(
                        28, // default
                        sm: 24, // small 
                        md: 28, // medium
                        lg: 32, // large 
                        xl: 36, // extra large screen
                      ),
                      color: Color.fromARGB(255, 248, 238, 224),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' @ $companyName',
                        style: TextStyle(
                          fontFamily: "Aileron",
                          fontWeight: FontWeight.w200,
                          fontSize: context.responsive<double>(
                            28, // default
                            sm: 24, // small 
                            md: 28, // medium
                            lg: 32, // large 
                            xl: 36, // extra large screen
                          ),
                          color: Color.fromARGB(255, 248, 238, 224),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: context.responsive<double>(
                      30, // default
                      sm: 20, // small 
                      md: 30, // medium
                      lg: 40, // large 
                      xl: 50, // extra large screen
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: bulletPoints
                      .map(
                        (point) => Text(
                          '• $point',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Aileron",
                            fontWeight: FontWeight.w200,
                            fontSize: context.responsive<double>(
                              20, // default
                              sm: 18, // small 
                              md: 20, // medium
                              lg: 22, // large 
                              xl: 24, // extra large screen
                            ),
                            color: Color.fromARGB(255, 248, 238, 224),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactsPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SocialItem(
            logoAssetPath: "assets/linkedin_icon.svg", 
            text: "Christopher Tesar",
            uri: Uri.parse('https://www.linkedin.com/in/christopher-tesar-9853a113b/'),
          ),
          SocialItem(
            logoAssetPath: "assets/github_icon.svg", 
            text: "christophertesar",
            uri: Uri.parse('https://github.com/christophertesar')
          ),
          SocialItem(logoAssetPath: "assets/email_icon.svg", text: "ctesar@sfu.ca"),
        ],
      )
    );
  }
}

class SocialItem extends StatelessWidget{
  final String logoAssetPath;
  final String text;
  final Uri? uri;

  const SocialItem({
    Key? key,
    required this.logoAssetPath,
    required this.text,
    this.uri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          logoAssetPath, // Replace with your image URL
          width: 25, // Adjust width as needed
          height: 25, // Adjust height as needed
          fit: BoxFit.cover, // Adjust image fitting as needed
          color: Color.fromARGB(255, 248, 238, 224)
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 5
          )
        ),
        if(uri != null)
          InkWell(
            onTap: () => {launchUrl(uri!)},
            child: Text(
            textAlign: TextAlign.left,
            text,
            style: TextStyle(
              fontFamily: "Aileron", 
              fontWeight: FontWeight.w200, 
              fontSize: context.responsive<double>(
                12, // default
                sm: 10, // small 
                md: 12, // medium
                lg: 14, // large 
                xl: 16, // extra large screen
              ), 
              color: Color.fromARGB(255, 248, 238, 224)),
            ),
          )
        else
          Text(
            textAlign: TextAlign.left,
            text,
            style: TextStyle(
              fontFamily: "Aileron", 
              fontWeight: FontWeight.w200, 
              fontSize: context.responsive<double>(
                12, // default
                sm: 10, // small 
                md: 12, // medium
                lg: 14, // large 
                xl: 16, // extra large screen
              ), 
              color: Color.fromARGB(255, 248, 238, 224)),
          ),
      ],
    );
  }
}

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1440
        ? (xl ?? lg ?? md ?? sm ?? defaultVal)
        : wd >= 1281
            ? (lg ?? md ?? sm ?? defaultVal)
            : wd >= 1024
                ? (md ?? sm ?? defaultVal)
                : wd >= 768
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }
}
