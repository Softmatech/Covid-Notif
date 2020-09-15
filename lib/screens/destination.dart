import 'package:flutter/material.dart';


class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Sign In', Icons.person_pin),
  Destination('Sign Up', Icons.supervised_user_circle),
];

class DestinationView extends StatefulWidget {
  const DestinationView({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  TextEditingController _textController;


  @override
  void initState() {
    super.initState();
    // _textController = TextEditingController(
      // text:  widget.destination.title,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('${widget.destination.title}')),
        backgroundColor: Colors.black45,
      ),
      backgroundColor: Color.fromRGBO(55, 23, 65, 1),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(controller: _textController),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}