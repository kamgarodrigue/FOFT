import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:foft/api/AuthService.dart';
import 'package:foft/api/FicheService.dart';
import 'package:foft/api/date.dart';
import 'package:foft/colors.dart';
import 'package:foft/components/Intput.dart';
import 'package:foft/components/Loader.dart';
import 'package:foft/modal/delegue.dart';
import 'package:foft/modal/enseignant.dart';
import 'package:foft/modal/fiche.dart';
import 'package:intl/intl.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UpdateFiche extends StatefulWidget {
  Fiche fiche;
  UpdateFiche({Key? key, required this.fiche}) : super(key: key);

  @override
  State<UpdateFiche> createState() => _UpdateFicheState();
}

class _UpdateFicheState extends State<UpdateFiche> {
  int currentStep = 0;
  List<Widget> steps = [];
  String? date = "";
  Image img = Image.asset("assets/images/Vector (3).png");

  TextEditingController controller = TextEditingController();
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

// INITIALIZE. RESULT IS A WIDGET, SO IT CAN BE DIRECTLY USED IN BUILD METHOD
  @override
  void initState() {
    super.initState();
    context.read<Data>().semestres();
    context.read<Data>().niveaux();
    context.read<Data>().salles();
    context.read<Data>().seances();
    context.read<Data>().specialites();
    context.read<Data>().ue(widget.fiche.semestre, widget.fiche.niveau["id"]);
    context.read<Data>().enseignants().then((value) => print(value));
    print(widget.fiche.toJson());
  }

  bool _isLoading = false;

  Uint8List? image;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final data = context.watch<Data>();

    steps = [
      Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kSecondaryColor),
            child: DropdownButtonFormField<dynamic>(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 8)),
              hint: Text("Semestre ${widget.fiche.semestre}",
                  style: TextStyle(
                      color: kBlack, fontSize: 17, fontFamily: 'ComRegular.')),
              items: context
                  .read<Data>()
                  .semestre
                  .map<DropdownMenuItem<dynamic>>((e) => DropdownMenuItem(
                        value: e['id'],
                        child: Text(" " + e["intitule"].toString(),
                            style: TextStyle(
                                color: kBlack,
                                fontSize: 17,
                                fontFamily: 'ComRegular.')),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  widget.fiche.semestre = value.toString();
                });
                print(widget.fiche.semestre);
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kSecondaryColor),
            child: DropdownButtonFormField<dynamic>(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 8)),
              hint: Text("Niveau ${widget.fiche.niveau["intitule"]}",
                  style: TextStyle(
                      color: kBlack, fontSize: 17, fontFamily: 'ComRegular.')),
              items: context
                  .read<Data>()
                  .niveau!
                  .map<DropdownMenuItem<dynamic>>((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e["intitule"]!,
                            style: TextStyle(
                                color: kBlack,
                                fontSize: 17,
                                fontFamily: 'ComRegular.')),
                      ))
                  .toList(),
              onChanged: (value) {
                widget.fiche.niveau = value;
                context
                    .read<Data>()
                    .ue(widget.fiche.semestre, widget.fiche.niveau["id"])
                    .then((value) => print(value));
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kSecondaryColor),
            child: DropdownButtonFormField<dynamic>(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 8)),
              hint: Text("UE ${widget.fiche.ue["code"]}",
                  style: TextStyle(
                      color: kBlack, fontSize: 17, fontFamily: 'ComRegular.')),
              items: data.UE!
                  .map<DropdownMenuItem<dynamic>>((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e["code"]!,
                            style: TextStyle(
                                color: kBlack,
                                fontSize: 17,
                                fontFamily: 'ComRegular.')),
                      ))
                  .toList(),
              onChanged: (value) {
                widget.fiche.ue = value;
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kSecondaryColor),
            child: DropdownButtonFormField<dynamic>(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 8)),
              hint: Text("Specialite ${widget.fiche.specialite["code"]}",
                  style: TextStyle(
                      color: kBlack, fontSize: 17, fontFamily: 'ComRegular.')),
              items: data.specialite!
                  .map<DropdownMenuItem<dynamic>>((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e["code"]!,
                            style: TextStyle(
                                color: kBlack,
                                fontSize: 17,
                                fontFamily: 'ComRegular.')),
                      ))
                  .toList(),
              onChanged: (value) {
                widget.fiche.specialite = value;
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kSecondaryColor),
            child: DropdownButtonFormField<dynamic>(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 8)),
              hint: Text("${widget.fiche.enseignant.nom}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: kBlack, fontSize: 17, fontFamily: 'ComRegular.')),
              items: data.enseignant!
                  .map<DropdownMenuItem<dynamic>>((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e["nom"]!,
                            style: TextStyle(
                                color: kBlack,
                                fontSize: 17,
                                fontFamily: 'ComRegular.')),
                      ))
                  .toList(),
              onChanged: (value) {
                widget.fiche.enseignant = Enseignant.fromJson(value);
                print(widget.fiche.enseignant.nom);
              },
            ),
          ),
        ],
      ),
//--- step 2-------------------------------------

      Column(children: [
        Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: kSecondaryColor),
          child: DropdownButtonFormField<dynamic>(
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 8)),
            hint: Text("Salle ${widget.fiche.salle["nom"]}",
                style: TextStyle(
                    color: kBlack, fontSize: 17, fontFamily: 'ComRegular.')),
            items: data.salle!
                .map<DropdownMenuItem<dynamic>>((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e["nom"]!,
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 17,
                              fontFamily: 'ComRegular.')),
                    ))
                .toList(),
            onChanged: (value) {
              widget.fiche.salle = value;
            },
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: kSecondaryColor),
          child: DropdownButtonFormField<dynamic>(
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 8)),
            hint: Text("Seance ${widget.fiche.seance["nom"]}",
                style: TextStyle(
                    color: kBlack, fontSize: 17, fontFamily: 'ComRegular.')),
            items: data.seance!
                .map<DropdownMenuItem<dynamic>>((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e["nom"]!,
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 17,
                              fontFamily: 'ComRegular.')),
                    ))
                .toList(),
            onChanged: (value) {
              widget.fiche.seance = value;
            },
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Input(
          isSide: false,
          contentPadding: EdgeInsets.zero,
          fontSize: 17,
          heigth: 40,
          isObscureText: false,
          padding: EdgeInsets.only(left: 10),
          raduis: 30.0,
          text: '${widget.fiche.titre}',
          value: widget.fiche.titre!,
          onChanged: (value) {
            widget.fiche.titre = value;
          },
          type: 'text',
          getDate: () {},
        ),
      ]),
      //--- step 3-------------------------------------
      Column(
        children: [
          Input(
            value: date!,
            type: 'date',
            isSide: false,
            prefixIcon: Icon(
              Icons.calendar_today,
              color: kLinckColor,
            ),

            contentPadding: EdgeInsets.zero,
            fontSize: 17,
            heigth: 40,
            isObscureText: false,
            padding: EdgeInsets.only(left: 8),
            raduis: 30.0,

            text: widget.fiche.date!,
            //value: this.dateinput.text,
            getDate: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                      2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101));

              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(pickedDate
                    .toString()); //formatted date output using intl package =>  2021-03-16
                //you can implement different kind of Date Format here according to your requirement

                setState(() {
                  date = formattedDate;
                  widget.fiche.date = formattedDate;
                  //set output date to TextField value.
                });
              } else {
                print("Date is not selected");
              }
            },
            onChanged: (val) {},
          ),
          SizedBox(
            height: 16,
          ),
          Input(
            isSide: false,
            contentPadding: EdgeInsets.zero,
            fontSize: 17,
            heigth: 40,
            isObscureText: false,
            padding: EdgeInsets.only(left: 10),
            raduis: 30.0,
            text: 'Heure de Début',
            value: widget.fiche.heureDebut!,
            onChanged: (value) {
              widget.fiche.heureDebut = value;
            },
            type: 'texte',
            getDate: () {},
          ),
          SizedBox(
            height: 16,
          ),
          Input(
            isSide: false,
            contentPadding: EdgeInsets.zero,
            fontSize: 17,
            heigth: 40,
            isObscureText: false,
            padding: EdgeInsets.only(left: 10),
            raduis: 30.0,
            text: 'Heure de Fin',
            value: widget.fiche.heureFin!,
            onChanged: (value) {
              widget.fiche.heureFin = value;
            },
            type: 'text',
            getDate: () {},
          ),
          SizedBox(
            height: 16,
          ),
          Input(
            isSide: false,
            contentPadding: EdgeInsets.zero,
            fontSize: 17,
            heigth: 40,
            isObscureText: false,
            padding: EdgeInsets.only(left: 10),
            raduis: 30.0,
            text: 'Total Hauraire',
            value: widget.fiche.totalHoraire!,
            onChanged: (value) {
              widget.fiche.totalHoraire = value;
            },
            type: 'text',
            getDate: () {},
          ),
        ],
      ),
      Column(
        children: [
          MarkdownTextInput(
            (String value) => setState(() => widget.fiche.contenu = value),
            widget.fiche.contenu!,
            label: 'Contenu du cour',
            maxLines: 10,
            actions: MarkdownType.values,
            controller: controller,
            textStyle: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 16,
          ),
          /*  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Signature",
                  style: TextStyle(
                      color: kBlack, fontSize: 17, fontFamily: 'ComRegular.')),
              IconButton(
                  onPressed: () async {
                    image = await _controller.toPngBytes();

                    _controller.clear();
                  },
                  icon: Icon(Icons.clear))
            ],
          ),
          SizedBox(
            height: 10,
          ),
           Signature(
            controller: _controller,
            width: 300,
            height: 200,
            backgroundColor: kSecondaryColor,
          ),
          SizedBox(
            height: 16,
          ),*/
          GestureDetector(
            onTap: () async {
              image = await _controller.toPngBytes();

              widget.fiche.delegue = context.read<AuthService>().user!;
              // print(image);
              setState(() {
                _isLoading = true;
              });
              print(widget.fiche.toJson());
              context
                  .read<FicheService>()
                  .Updatefiche(widget.fiche)
                  .then((value) => {
                        //print(value),
                        setState(() {
                          _isLoading = false;
                        }),
                        Navigator.of(context).pop(),
                        //  initfiche(),
                        showTopSnackBar(
                          context,
                          CustomSnackBar.success(
                            message: value.toString(),
                          ),
                        )
                      })
                  .catchError((onError) {
                print(onError);
                showTopSnackBar(
                  context,
                  CustomSnackBar.error(
                    message: onError.toString(),
                  ),
                );
                setState(() {
                  _isLoading = false;
                });
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 103,
              child: Text("Valider",
                  style: TextStyle(
                      color: whiteColor, fontSize: 17, fontFamily: 'Bold')),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(123, 229, 170, 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      )
    ];

    return Scaffold(
      body: Stack(
        children: [
          CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Modifier UNE FICHE',
                  style: TextStyle(
                      color: kLinckColor,
                      fontSize: 17,
                      fontFamily: 'ComRegular.')),
            ),
            child: SafeArea(
              child: OrientationBuilder(
                builder: (BuildContext context, Orientation orientation) {
                  switch (orientation) {
                    case Orientation.portrait:
                      return _buildStepper(StepperType.vertical);
                    case Orientation.landscape:
                      return _buildStepper(StepperType.horizontal);
                    default:
                      throw UnimplementedError(orientation.toString());
                  }
                },
              ),
            ),
          ),
          Container(
              child: _isLoading
                  ? Loader(loadingTxt: 'Creation de compte encour ...')
                  : Container())
        ],
      ),
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 3;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        for (var i = 0; i < 4; ++i)
          _buildStep(
              title: Text('Step ${i + 1}'),
              isActive: i == currentStep,
              state: i == currentStep
                  ? StepState.editing
                  : i < currentStep
                      ? StepState.complete
                      : StepState.indexed,
              content: steps[i]),
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    Widget content = const LimitedBox(
      maxWidth: 300,
      maxHeight: 300,
      // child: const  Container(color:  CupertinoColors.systemGrey),
    ),
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: content,
    );
  }
}
