import 'package:flutter/material.dart';
import 'package:leadeetuto/screens/guest/password.dart';

class TermPage extends StatefulWidget {
  final Function(int) onChangedStep;
  const TermPage({required this.onChangedStep});
  @override
  _TermPageState createState() => _TermPageState();
}

class _TermPageState extends State<TermPage> {
  late ScrollController _scrollController;
  bool _termReaded = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() => _termReaded = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Term &  Conditions',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => widget.onChangedStep(0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source...On sait depuis longtemps que travailler avec du texte lisible et content de sens est source..."),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              onPressed: !_termReaded
                  ? null
                  : () {
                      widget.onChangedStep(2);
                    },
              color: Theme.of(context).primaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Text(
                'accept & continue'.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
