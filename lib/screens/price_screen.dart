import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/utilities/coin_data.dart';
import 'package:bitcoin_ticker/services/network.dart';
import 'package:bitcoin_ticker/components/reusable_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var _selectedItem;
  var _btcText;
  var _ethText;
  var _ltcText;

  @override
  void initState() {
    super.initState();

    _selectedItem = Platform.isIOS ? currenciesList.indexOf('USD') : 'USD';
    _btcText = '1 BTC = ? $_selectedItem';
    _ethText = '1 ETH = ? $_selectedItem';
    _ltcText = '1 LTC = ? $_selectedItem';
    updateUI();
  }

  void updateUI() async {
    double btc = await NetworkHelper.getExchangeRate('BTC', _selectedItem);
    double eth = await NetworkHelper.getExchangeRate('ETH', _selectedItem);
    double ltc = await NetworkHelper.getExchangeRate('LTC', _selectedItem);

    setState(() {
      _btcText = '1 BTC = ${btc.toStringAsFixed(2)} $_selectedItem';
      _ethText = '1 ETH = ${eth.toStringAsFixed(2)} $_selectedItem';
      _ltcText = '1 LTC = ${ltc.toStringAsFixed(2)} $_selectedItem';
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
          Column(
            children: [
              ReusableCard(
                text: _btcText,
              ),
              ReusableCard(
                text: _ethText,
              ),
              ReusableCard(
                text: _ltcText,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
