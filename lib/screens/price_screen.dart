import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/utilities/coin_data.dart';
import 'package:bitcoin_ticker/services/network.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var _selectedItem;
  var _btcText;

  @override
  void initState() {
    super.initState();

    _selectedItem = Platform.isIOS ? currenciesList.indexOf('USD') : 'USD';
    _btcText = '1 BTC = ?';
    updateUI();
  }

  void updateUI() async {
    double btc = await NetworkHelper.getBtcRate(_selectedItem);

    setState(() {
      _btcText = '1 BTC = ${btc.toStringAsFixed(2)} $_selectedItem';
    });
  }

  DropdownButton androidItemPicker() {
    List<DropdownMenuItem<String>> items = [];

    for (String currency in currenciesList) {
      items.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    // NetworkHelper networkHelper = NetworkHelper();

    return DropdownButton(
      items: items,
      onChanged: (value) async {
        setState(() {
          _selectedItem = value;
          updateUI();
        });
      },
      value: _selectedItem,
    );
  }

  Widget iosItemPicker() {
    List<Widget> items = [];

    for (String currency in currenciesList) {
      items.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      children: items,
      itemExtent: 32.0,
      onSelectedItemChanged: (index) {
        setState(() {
          _selectedItem = currenciesList[index];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // updateUI();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  _btcText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosItemPicker() : androidItemPicker(),
          ),
        ],
      ),
    );
  }
}
