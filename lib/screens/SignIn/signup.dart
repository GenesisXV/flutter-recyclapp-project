import 'package:flutter/material.dart';
import 'package:recyclapp_v1/screens/SignUp/signupwithmail.dart';
import 'package:recyclapp_v1/utils/constants.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: colorOne),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(children: <Widget>[
              Expanded(child: Divider(thickness: 2)),
              Text(
                " S'inscrire ",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              Expanded(
                  child: Divider(
                thickness: 2,
              )),
            ]),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: new RawMaterialButton(
                  onPressed: () {
                    print('touched email');
//                    widget.parentAction(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpWithMail()),
                    );
                  },
                  child: new Icon(
                    Icons.mail,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.redAccent,
                  padding: const EdgeInsets.all(15.0),
                ),
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 14),
              ),
              Container(
                child: new RawMaterialButton(
                  onPressed: () {},
                  child: Text(
                    'f',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 56,
                        fontWeight: FontWeight.bold),
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.blue[900],
                  padding: const EdgeInsets.all(8.0),
                ),
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 14),
              ),
              Container(
                child: new RawMaterialButton(
                  onPressed: () {},
                  child: Image.asset(
                    "images/search.png",
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(22.0),
                ),
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
