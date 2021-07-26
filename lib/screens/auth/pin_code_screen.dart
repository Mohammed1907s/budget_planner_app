import 'dart:math';
import 'package:budget_planner_app/utils/size_config.dart';
import 'package:budget_planner_app/widgets/app_text.dart';
import 'package:budget_planner_app/widgets/elevated_button_app.dart';
import 'package:budget_planner_app/widgets/pin_code_button.dart';
import 'package:budget_planner_app/widgets/pin_code_field.dart';
import 'package:budget_planner_app/widgets/pin_code_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  String _pinCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color:  Color(0xFF472FC8)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(33),
          start: SizeConfig.scaleWidth(20),
          end: SizeConfig.scaleWidth(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextApp(
                text: AppLocalizations.of(context)!.enter_passcode,
                color: Color(0xff0D0E56),
                fontSize: 20,
                fontWeight: FontWeight.w700),
            TextApp(
                text: AppLocalizations.of(context)!.new_pin,
                color: Color(0xff7B7C98),
                fontSize: 15,
                fontWeight: FontWeight.w400),
            SizedBox(height: SizeConfig.scaleHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinCodeField(
                  code: _getPinFieldCode(position: 1),
                  marginEnd: SizeConfig.scaleWidth(12),
                ),
                PinCodeField(
                  code: _getPinFieldCode(position: 2),
                  marginEnd: SizeConfig.scaleWidth(12),
                ),
                PinCodeField(
                  code: _getPinFieldCode(position: 3),
                  marginEnd: SizeConfig.scaleWidth(12),
                ),
                PinCodeField(
                  code: _getPinFieldCode(position: 4),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.scaleHeight(65)),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: SizeConfig.scaleWidth(48),
                end: SizeConfig.scaleWidth(48),
              ),
              child: Column(
                children: [
                  PinCodeRow(
                    firstNumber: '1',
                    firstNumberAction: () => setPinCode(code: '1'),
                    secondNumber: '2',
                    secondNumberAction: () => setPinCode(code: '2'),
                    thirdNumber: '3',
                    thirdNumberAction: () => setPinCode(code: '3'),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(25)),
                  PinCodeRow(
                    firstNumber: '4',
                    firstNumberAction: () => setPinCode(code: '4'),
                    secondNumber: '5',
                    secondNumberAction: () => setPinCode(code: '5'),
                    thirdNumber: '6',
                    thirdNumberAction: () => setPinCode(code: '6'),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(25)),
                  PinCodeRow(
                    firstNumber: '7',
                    firstNumberAction: () => setPinCode(code: '7'),
                    secondNumber: '8',
                    secondNumberAction: () => setPinCode(code: '8'),
                    thirdNumber: '9',
                    thirdNumberAction: () => setPinCode(code: '9'),
                  ),
                  SizedBox(height: SizeConfig.scaleHeight(25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PinCodeButton(
                        number: '0',
                        marginEnd: SizeConfig.scaleWidth(32),
                        onPressed: () => setPinCode(code: '0'),
                      ),
                      PinCodeButton(
                        icon: Icons.backspace,
                        color:  Color(0xFF472FC8),
                        onPressed: () => removeCode(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.scaleHeight(88)),
            ElevatedButtonApp(
              text: AppLocalizations.of(context)!.apply,
              color: _pinCode.length == 4
                  ? Colors.deepPurpleAccent
                  : Colors.grey,
              onPressed: () => applyCode(),
            )
          ],
        ),
      ),
    );
  }

  String? _getPinFieldCode({required int position}) {
    if (_pinCode.isNotEmpty && _pinCode.length >= position) {
      return _pinCode[position - 1];
    }
  }

  void setPinCode({required String code}) {
    if (_pinCode.length < 4) {
      setState(() {
        _pinCode += code;
      });
    }
  }

  void removeCode() {
    if (_pinCode.isNotEmpty) {
      setState(() {
        _pinCode = _pinCode.substring(0, _pinCode.length - 1);
      });
    }
  }

  void applyCode() {
    if (_pinCode.length == 4) {
      Navigator.pop(context, _pinCode);
    }
  }
}
