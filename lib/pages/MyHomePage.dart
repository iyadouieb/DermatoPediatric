import 'package:flutter/material.dart';
import '../res/constants.dart';
import 'CasesPage.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.0,
              ),
              Text(
                'DermatMaroc',
                style: GoogleFonts.roboto(
                    color: MyGreyColor,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w300,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 2.0,
                    width: 200.0,
                    color: MyOrangeColor,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Quiz',
                    style: GoogleFonts.roboto(
                        fontSize: 20.0,
                        color: MyGreyColor,
                        fontWeight: FontWeight.w200
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CasesPage()),);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 10.0),
                  child: Text(
                    'Commencer',
                    style: GoogleFonts.roboto(
                      color: MyGreyColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyOrangeColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                  onPressed: () {
                    showAboutDialog(
                      context: context,
                      applicationVersion: '1.0',
                    );
                  },

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'A Propos',
                      style: GoogleFonts.roboto(
                        fontSize: 20.0,
                        color: MyGreyColor,
                        fontWeight: FontWeight.w200
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
