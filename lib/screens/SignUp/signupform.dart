import 'package:flutter/material.dart';
import 'package:recyclapp_v1/utils/constants.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm(this.emailTextController, this.passwordTextController,
      this.nameTextController, this.parentAction);

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final TextEditingController nameTextController;

  final ValueChanged<List<dynamic>> parentAction;

  @override
  State<StatefulWidget> createState() => _SignUpForm();
}

enum GenderEnum { man, woman }

class _SignUpForm extends State<SignUpForm>
    with AutomaticKeepAliveClientMixin<SignUpForm> {
  GenderEnum _userGender = GenderEnum.man;
  String _selectDateString = 'Date de Naissance';

  bool _agreedToTerm = false;
  DateTime _selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1930, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _selectDateString = "${_selectedDate.toLocal()}".split(' ')[0];
        _passDataToParent('age', calculateAge(picked));
      });
    print('your age is ${calculateAge(picked!)}');
  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  void _setAgreedToTerm(bool newValue) {
    _passDataToParent('term', newValue);
    setState(() {
      _agreedToTerm = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(13.0),
      decoration: BoxDecoration(
        border: Border.all(color: colorOne),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 360,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.mail),
                  labelText: 'Email',
                  hintText: 'Entrez votre email'),
              validator: (e) {
                if (e!.trim().isEmpty) {
                  return 'Email requis';
                } else {
                  return null;
                }
              },
              controller: widget.emailTextController,
            ),
          ),
          Divider(),
          SizedBox(
            width: 360,
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.lock),
                  labelText: 'Mot de passe',
                  hintText: 'Entrez votre mot de passe'),
              validator: (e) {
                if (e!.trim().isEmpty) {
                  return 'Mot de passe requis';
                } else {
                  return null;
                }
              },
              controller: widget.passwordTextController,
            ),
          ),
          Divider(),
          SizedBox(
            width: 360,
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.account_circle),
                  labelText: 'Pseudo',
                  hintText: 'Entrez votre pseudo'),
              validator: (e) {
                if (e!.trim().isEmpty) {
                  return 'Pseudo requis';
                } else {
                  return null;
                }
              },
              controller: widget.nameTextController,
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Icon(
                Icons.wc,
                color: Colors.grey,
              ),
              Radio(
                value: GenderEnum.man,
                groupValue: _userGender,
                onChanged: (dynamic e) {
                  setState(() {
                    _passDataToParent('genre', 'Homme');
                    _userGender = e;
                  });
                },
              ),
              new GestureDetector(
                onTap: () {
                  setState(() {
                    _passDataToParent('genre', 'Homme');
                    _userGender = GenderEnum.man;
                  });
                },
                child: Text('Homme'),
              ),
              SizedBox(
                width: 20,
              ),
              Radio(
                value: GenderEnum.woman,
                groupValue: _userGender,
                onChanged: (dynamic e) {
                  setState(() {
                    _passDataToParent('genre', 'Femme');
                    _userGender = e;
                  });
                },
              ),
              new GestureDetector(
                onTap: () {
                  setState(() {
                    _passDataToParent('genre', 'Femme');
                    _userGender = GenderEnum.woman;
                  });
                },
                child: Text('Femme'),
              ),
            ],
          ),
          Divider(),
          SizedBox(
            width: 360,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.cake,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Container(
                    width: 260,
                    child: RaisedButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text(_selectDateString),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                    value: _agreedToTerm,
                    onChanged: (bool? value) {
                      setState(() {
                        _agreedToTerm = value!;
                      });
                    }),
                GestureDetector(
                  onTap: () => _setAgreedToTerm(!_agreedToTerm),
                  child: const Text(
                    "I agree to Terms of Services, Privacy Policy.",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _passDataToParent(String key, dynamic value) {
    List<dynamic> addData = [];
    addData.add(key);
    addData.add(value);
    widget.parentAction(addData);
  }

  @override
  bool get wantKeepAlive => true;
}
