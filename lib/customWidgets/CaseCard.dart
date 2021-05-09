import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/CaseDetailsPage.dart';
import 'package:todo_app/res/constants.dart';
import 'package:todo_app/res/Cases.dart';

class CaseCard extends StatefulWidget {

  final int index;

  CaseCard({this.index});

  @override
  _CaseCardState createState() => _CaseCardState();
}

class _CaseCardState extends State<CaseCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DefaultPadding),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CaseDetailsPage(index: widget.index,)),);
        },
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: widget.index,
                child: Image.asset(cases[widget.index].imageURL)
              ),
              Padding(
                padding: const EdgeInsets.all(DefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cas N°' + '${widget.index + 1} : ' + cases[widget.index].title,
                      style: GoogleFonts.roboto(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '  ' + cases[widget.index].description,
                      style: GoogleFonts.roboto(
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
