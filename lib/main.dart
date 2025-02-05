import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 16, 29, 58),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/linkedin_icon.svg',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  launchUrl(Uri.parse('https://www.linkedin.com/in/christopher-tesar-9853a113b/'));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/github_icon.svg',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  launchUrl(Uri.parse('https://github.com/christophertesar'));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/email_icon.svg',
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  launchUrl(
                    Uri(
                      scheme: 'mailto',
                      path: "ctesar@sfu.ca"
                    )
                  );
                },
              ),
            ),
          ],
        ),
        backgroundColor: ColorScheme.backgroundColor,
        body: const PortfolioPage(),
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
        const TitlePage(),
        // Each child represents a page in the portfolio
        SwiperPage(
          images: const [
            "assets/RescueReady.jpg",
            "assets/Eznote.jpg",
            "assets/osrs_vr.jpg",
            "assets/motor_torque.jpg"
          ],
          titles: const [
            "SFU EC 2024 1st Place: RescueReady",
            "WEC 2024 1st Place: EzNote ",
            "Old School Runescape in VR",
            "Embedded Motor Speed/Torque Sensor",
          ],
          text: const [
            "A project made with my team for the Simon Fraser University Engineering Programming Competition where we won first place. We designed Rescue Ready, an app that connects the user with a volunteer during a natural disaster.",
            "At the Western Engineering Competition, we developed an app that helps people with cognitive disabilities take notes in a school or work environment. We impemented Text-To-Speech, Speech-To-Text, text summarization and a UI in Python using Tkinter.",
            "OSRS in VR allows adventurers to explore Gilenor in VR! Supported on the Meta Quest platform, users can interact with items, enjoy the scenery and find monsters walking around.",
            "My final project at the British Columbia Institute of Technology. Using a TI MSP432 Microcontroller, we using an optical encoder disc and two optical sensors to measure the speed of a synchronous motor. We also had a load cell that measured the output torque of the motor."
          ],
          link: [
            Uri.parse("https://github.com/amot-dev/RescueReady"),
            Uri.parse("https://github.com/christophertesar/wec_2024"),
            Uri.parse("https://github.com/christophertesar/osrs"),
            Uri.parse("https://github.com/christophertesar/Motor-Speed-and-Torque-Sensing")
          ]
        ),

        const ExperiencePage(),

        ContactsPage(),
      ],
    );
  }
}

class SwiperPage extends StatefulWidget{
  final List<String> images;
  final List<String> titles;
  final List<String> text;
  final List<Uri> link;

  const SwiperPage(
    {
      Key? key,
      required this.images,
      required this.text,
      required this.link,
      required this.titles
    }
    ) : super(key: key);
  
  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage>{
  String? currentTitle;
  String? currentText;
  int index = 0;

  @override
  void initState() {
    super.initState();
    currentText = widget.text[0];
    currentTitle = widget.titles[0];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Expanded(
            flex: 2,
            child: Text(
              textAlign: TextAlign.left,
              "Projects",
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
                color: ColorScheme.whiteTextColor
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: context.responsive<double>(
                      MediaQuery.of(context).size.width * 0.08, // default
                      sm: MediaQuery.of(context).size.width * 0.08, // small 
                      md: MediaQuery.of(context).size.width * 0.08, // medium
                      lg: MediaQuery.of(context).size.width * 0.08, // large 
                      xl: MediaQuery.of(context).size.width * 0.08, // extra large screen
                  )),
                ),
                Column(
                  children: [
                    Swiper(
                      onTap: (index) => launchUrl(widget.link[(index - 1) % widget.link.length]),
                      onIndexChanged: (index) => {setState(() => 
                        {
                        currentText = widget.text[index],
                        currentTitle = widget.titles[index],
                        this.index = index
                        }
                      )},
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            DoublePhotoFrame(
                              innerBorder: ColorScheme.innerBorderColor, 
                              outerBorder: ColorScheme.outerBorderColor,
                              logoAssetPath: widget.images[index],
                              borderRadius: 40,
                              borderSpace: MediaQuery.of(context).size.width * 0.015,
                              imageSizeSm: MediaQuery.of(context).size.width * 0.2,
                              imageSizeMd: MediaQuery.of(context).size.width * 0.2,
                              imageSizeLg: MediaQuery.of(context).size.width * 0.2,
                              imageSizeXl: MediaQuery.of(context).size.width * 0.2,
                            ),
                          ]
                        );
                      },
                      itemCount: widget.images.length,
                      itemWidth: MediaQuery.of(context).size.width * 0.3,
                      itemHeight: MediaQuery.of(context).size.height * 0.6,
                      layout: SwiperLayout.TINDER,
                      autoplay: true,
                      autoplayDelay: 9000,
                    ),
                    AnimatedSmoothIndicator(  
                      activeIndex: index,  
                      count: widget.text.length,  
                      effect: const WormEffect(
                        dotColor: ColorScheme.innerBorderColor,
                        activeDotColor: ColorScheme.outerBorderColor
                      ),  
                    ) 
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container()
                      ),
                      Text(
                        currentTitle!,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: "Aileron",
                          fontWeight: FontWeight.w600,
                          fontSize: context.responsive<double>(
                            24, // default
                            sm: 22, // small 
                            md: 24, // medium
                            lg: 26, // large 
                            xl: 28, // extra large screen
                          ),
                          color: ColorScheme.whiteTextColor,
                        )
                      ),
                      Text(
                        currentText!,
                        textAlign: TextAlign.start,
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
                          color: ColorScheme.whiteTextColor,
                        )
                      ),
                      Expanded(
                        flex: 4,
                        child: Container()
                      ),
                    ],
                  )
                )
              ],
            )    
          )
        ]
      )
    );
  }
}

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInText(
                    delayDuration: const Duration(seconds: 1),
                    text: RichText(
                      text: TextSpan(
                        text: "Hi,",
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
                          color:ColorScheme.whiteTextColor
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' nice to meet you.',
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
                                color: ColorScheme.whiteTextColor)
                          ),
                        ]
                      )
                    ),
                  ),
                  FadeInText(
                    delayDuration: Duration(seconds: 1, milliseconds: 500), 
                    text: RichText(
                      text: TextSpan(
                        text: 'I\'m',
                        style: TextStyle(fontFamily: "Aileron", 
                        fontWeight: FontWeight.w200, 
                        fontSize: context.responsive<double>(
                          72, // default
                          sm: 54, // small 
                          md: 72, // medium
                          lg: 86, // large 
                          xl: 100, // extra large screen,
                        ),
                        color: ColorScheme.whiteTextColor),
                        children: <TextSpan> [
                          TextSpan(
                            text: ' Christopher.',
                            style: TextStyle(
                              fontFamily: "Aileron", 
                              fontWeight: FontWeight.w800, 
                              fontSize: context.responsive<double>(
                                72, // default
                                sm: 54, // small 
                                md: 72, // medium
                                lg: 86, // large 
                                xl: 100, // extra large screen, 
                              ),
                            )
                          )
                        ]
                      )
                    ),
                  ),
                  FadeInText(
                    delayDuration: const Duration(seconds: 2), 
                    text: RichText(
                      text : TextSpan(
                        text: 'I am a ',
                        style: TextStyle(
                          color: ColorScheme.whiteTextColor,
                          fontFamily: "Aileron", 
                          fontWeight: FontWeight.w200, 
                          fontSize: context.responsive<double>(
                            50, // default
                            sm: 42, // small 
                            md: 50, // medium
                            lg: 72, // large 
                            xl: 86, // extra large screen, 
                          ),
                        ),
                        children: [
                          WidgetSpan(
                            child: CyclingText(
                            texts: [
                              'problem-solver.', // TODO: Hardcode this elsewhere. Code smell.
                              'software developer.',
                              'embedded enthusiast.',
                              ].map((text) => 
                              RichText(
                                text: TextSpan(
                                  text: text,
                                  style: TextStyle(
                                    color: ColorScheme.innerBorderColor,
                                    fontFamily: "Aileron", 
                                    fontWeight: FontWeight.w400, 
                                    fontSize: context.responsive<double>(
                                      50, // default
                                      sm: 42, // small 
                                      md: 50, // medium
                                      lg: 72, // large 
                                      xl: 86, // extra large screen, 
                                    )
                                  ),
                                ),
                              ),
                            ).toList()
                          )
                        )]
                      ),
                    ),
                  ),
                ]
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: DoublePhotoFrame(
                innerBorder: ColorScheme.innerBorderColor, 
                outerBorder: ColorScheme.outerBorderColor, 
                logoAssetPath: 'assets/self.jpg',
                imageSizeSm: MediaQuery.of(context).size.width * 0.3,
                imageSizeMd: MediaQuery.of(context).size.width * 0.3,
                imageSizeLg: MediaQuery.of(context).size.width * 0.3,
                imageSizeXl: MediaQuery.of(context).size.width * 0.3,
                borderRadius: 60,
                borderSpace: MediaQuery.of(context).size.width * 0.02,
              ),
            ),
          ),
        ],)
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
            color: ColorScheme.whiteTextColor),
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
        const ExperienceItem(
          logoAssetPath: 'assets/LMI_logo.jpg',
          positionName: 'Software Engineer Co-op',
          companyName: 'LMI Technologies',
          introduction: 'At LMI Technologes, I was a part of the Runtime Quality team where I developed and maintained features for the company Automated Test Framework API in Python. Some other things I accomplished: ',
          bulletPoints: [
            'Integrated KPIs and logging into the sensor stability test engine which identified a memory leak and enhanced performance monitoring.',
            'Wrote 60+ automated regression and stability tests spanning multiple sensor product lines covering core features.',
            'Developed an interface for Firmware‑level APIs into the ATF using ctypes, enabling team to access lower‑level sensor information.',
            'Implemented a commit visualization tool using Bamboo API to visualize commits from different teams, as well as performance information.',
            'Created a test coverage tracking tool, used by team members to monitor manual and automated tests, and identify areas for enhanced coverage.',
          ],
        ),
        const ExperienceItem(
          logoAssetPath: 'assets/SFU_logo.jpg',
          positionName: 'Undergraduate Reasearch Assistant',
          companyName: 'Simon Fraser University Faculty of Applied Science',
          introduction: 'Under Professor Rodney Vaughan and Chris Hynes PhD, I worked on creating a system that obtains and sends data from a three-loop antenna system using microcontrollers.',
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
  final String introduction;
  final List<String> bulletPoints;

  const ExperienceItem({
    Key? key,
    required this.logoAssetPath,
    required this.positionName,
    required this.companyName,
    required this.introduction,
    required this.bulletPoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsive<double>(
        475, // default
        sm: 425, // small 
        md: 475, // medium
        lg: 550, // large 
        xl: 600, // extra large screen
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DoublePhotoFrame(
            innerBorder: ColorScheme.innerBorderColor, 
            outerBorder: ColorScheme.outerBorderColor, 
            logoAssetPath: logoAssetPath
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
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInText(
                  delayDuration: const Duration(seconds: 1), 
                  text: RichText(
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
                        color: ColorScheme.whiteTextColor,
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
                            color: ColorScheme.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
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
                  children: [
                    Text(
                      "$introduction\n",
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
                        color: ColorScheme.whiteTextColor,
                      ),
                    )]..addAll(bulletPoints.map(
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
                          color: ColorScheme.whiteTextColor,
                        ),
                      ),
                    )
                    .toList(),
                  )
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
          SocialItem(
           logoAssetPath: "assets/email_icon.svg",
           text: "ctesar@sfu.ca",
           uri: Uri(
            scheme: 'mailto',
            path: "ctesar@sfu.ca"
            )  
          ),
        ],
      )
    );
  }
}

class MailToItem extends SocialItem{
  const MailToItem({
    Key? key,
    required String logoAssetPath,
    required String text,
    String? uri,
  }) : super(key: key, logoAssetPath: logoAssetPath, text: text);

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
          
          color: ColorScheme.whiteTextColor
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 5
          )
        ),
        if(uri != null)
          HoverColorChangeWidget(
            uri: uri,
            text: text,
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
              color: ColorScheme.whiteTextColor),
          ),
      ],
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
          
          color: ColorScheme.whiteTextColor
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 5
          )
        ),
        if(uri != null)
          HoverColorChangeWidget(
            uri: uri,
            text: text,
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
              color: ColorScheme.whiteTextColor),
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

class HoverColorChangeWidget extends StatefulWidget {
  final Uri? uri;
  final String text;

  HoverColorChangeWidget({Key? key, this.uri, required this.text}) : super(key: key);

  @override
  _HoverColorChangeWidgetState createState() => _HoverColorChangeWidgetState();
}

class _HoverColorChangeWidgetState extends State<HoverColorChangeWidget> {
  Color textColor = ColorScheme.whiteTextColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          textColor = Colors.blue; // Change this to the color you want when hovering
        });
      },
      onExit: (event) {
        setState(() {
          textColor = ColorScheme.whiteTextColor; // Or whatever your normal color is
        });
      },
      child: InkWell(
        onTap: () => launchUrl(widget.uri!),
        child: Text(
          widget.text,
          textAlign: TextAlign.left,
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
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class DoublePhotoFrame extends StatelessWidget{
  final Color outerBorder;
  final Color innerBorder;
  final String logoAssetPath;
  final double imageSizeSm;
  final double imageSizeMd;
  final double imageSizeLg;
  final double imageSizeXl;
  final double borderRadius;
  final double borderSpace;

  const DoublePhotoFrame({
    Key? key,
    required this.innerBorder,
    required this.outerBorder,
    required this.logoAssetPath,
    this.imageSizeSm = 100,
    this.imageSizeMd = 200,
    this.imageSizeLg = 250,
    this.imageSizeXl = 300,
    this.borderRadius = 40,
    this.borderSpace = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color: outerBorder, // Pink background
        padding: EdgeInsets.all(borderSpace),
        child: Container(
          padding: EdgeInsets.all(borderSpace), // Adjust margin as needed
          decoration: BoxDecoration(
            color: innerBorder, // Orange background
            borderRadius: BorderRadius.circular(borderRadius), // Optional: rounded corners
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.asset(
              logoAssetPath,
              width: context.responsive<double>(
                imageSizeMd, // default
                sm: imageSizeSm, // small 
                md: imageSizeMd, // medium
                lg: imageSizeLg, // large 
                xl: imageSizeXl, // extra large screen
              ), // Adjust width as needed
              height: context.responsive<double>(
                imageSizeMd, // default
                sm: imageSizeSm, // small 
                md: imageSizeMd, // medium
                lg: imageSizeLg, // large 
                xl: imageSizeXl, // extra large screen
              ), // Adjust height as needed
              fit: BoxFit.cover, // Adjust image fitting as needed
            ),
          ),
        ),
      )
    );
  }
}

class FadeInText extends StatefulWidget{
  final Duration delayDuration;
  final Duration animationDuration;
  final RichText text;

  const FadeInText({
    Key? key, 
    required this.delayDuration,
    required this.text,
    this.animationDuration = const Duration(seconds: 1)
  }) : super(key: key);

  @override
  _FadeInTextState createState() => _FadeInTextState();
}

class _FadeInTextState extends State<FadeInText>{
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delayDuration, () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0, // Set opacity based on the flag
        duration: widget.animationDuration, // Duration of the animation
        curve: Curves.easeInOut, // Curve for the animation
        child: widget.text,
      );
  }
}

class CyclingText extends StatefulWidget{
  final List<RichText> texts;
  final Duration onScreen = const Duration(seconds: 3);

  const CyclingText({
    Key? key,
    required this.texts,
  }) : super(key: key);

  @override
  _CyclingTextState createState() => _CyclingTextState();
}

class _CyclingTextState extends State<CyclingText>{
  int _currentIndex = 0;
  late Timer _timer;
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context){
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 500),
      child: widget.texts[_currentIndex]
    );
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent further callbacks
    super.dispose();
  }

  void _startTimer(){
    _timer = Timer.periodic(widget.onScreen, (timer) {
      setState(() {
        _opacity = 1.0; // Fade in
        _currentIndex = (_currentIndex + 1) % widget.texts.length;
      });

      Timer(const Duration(milliseconds: 2000), () {
        mounted ? setState(() {
          _opacity = 0.0; // Fade out
        }) : null;
      });
    });
  }

}

@immutable
class ColorScheme{
  static const whiteTextColor =Color.fromARGB(255, 248, 233, 213);
  static const outerBorderColor =Color.fromARGB(255, 252, 103, 54);
  static const innerBorderColor =Color.fromARGB(255, 255, 176, 176);
  static const backgroundColor =Color.fromARGB(255, 24, 40, 75);
}
