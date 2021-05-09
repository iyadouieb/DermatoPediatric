import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/res/constants.dart';
import 'package:todo_app/customWidgets/CaseCard.dart';
import 'package:todo_app/res/Cases.dart';

class CasesPage extends StatefulWidget {
  const CasesPage({Key key}) : super(key: key);

  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: MyGreyColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(DefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Cas Cliniques',
              style: GoogleFonts.roboto(
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cases.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CaseCard(index: index,);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
