import 'package:http/http.dart' as http;
import 'dart:convert';

const coinAPIURL =
    'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=AUD,BRL,CAD,CNY,EUR,GBP,HKD,IDR,ILS,INR,JPY,MXN,NOK,NZD,PLN,RON,RUB,SEK,SGD,USD,ZAR';
const apiKey = '';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String nameOfCoin) async {
    String requestedURL = '$coinAPIURL';

    http.Response response = await http.get(requestedURL);

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      // ignore: non_constant_identifier_names
      var coinRate = decodeData['$nameOfCoin'];

      return coinRate;
    } else {
      print(response.statusCode);
    }
  }
}
