import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/models/Case.dart';
import 'package:todo_app/models/QuestionItem.dart';
import 'package:todo_app/res/Cases.dart';
import 'package:todo_app/res/constants.dart';

class CaseDetailsPage extends StatefulWidget {
  final int index;

  const CaseDetailsPage({Key key, this.index}) : super(key: key);

  @override
  _CaseDetailsPageState createState() => _CaseDetailsPageState(index);
}

class _CaseDetailsPageState extends State<CaseDetailsPage> {
  int index;
  List<QuestionItem> questions = [];

  _CaseDetailsPageState(int index) {
    index = index;
    questions = GenerateQuestionItems(index);
  }

  @override
  Widget build(BuildContext context) {
    int caseIndex = widget.index;
    Case currentCase = cases[caseIndex];

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
        actions: [
          IconButton(
              icon: Icon(Icons.fast_forward_rounded, color: MyGreyColor,),

              onPressed: () {
                if(caseIndex + 1 < cases.length){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CaseDetailsPage(
                          index: caseIndex + 1,
                        )
                    ),
                  );
                }
              }
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: widget.index,
              child: Image(image: AssetImage(currentCase.imageURL))
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(DefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Case N° ' + '${caseIndex + 1} : ' + currentCase.title,
                    style: GoogleFonts.roboto(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(DefaultPadding),
                    child: Container(
                      height: 2.0,
                      color: MyOrangeColor,
                      width: 10.0,
                    ),
                  ),
                  Text(
                    '   ' + currentCase.description,
                    style: GoogleFonts.roboto(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ExpansionPanelList(
                    elevation: 0,
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        questions[index].isExpanded = !isExpanded;
                      });
                    },
                    children: questions.map((e) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.headerValue),
                          );
                        },
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.expandedValue),
                        ),
                        isExpanded: e.isExpanded,
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
