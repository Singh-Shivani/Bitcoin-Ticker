import 'dart:convert';
import 'package:http/http.dart' as http;

String crypto;
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
const coinAPIURLBTC =
    'https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=AUD,BRL,CAD,CNY,EUR,GBP,HKD,IDR,ILS,INR,JPY,MXN,NOK,NZD,PLN,RON,RUB,SEK,SGD,USD,ZAR';
const coinAPIURLETH =
    'https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=AUD,BRL,CAD,CNY,EUR,GBP,HKD,IDR,ILS,INR,JPY,MXN,NOK,NZD,PLN,RON,RUB,SEK,SGD,USD,ZAR';
const coinAPIURLLTC =
    'https://min-api.cryptocompare.com/data/price?fsym=LTC&tsyms=AUD,BRL,CAD,CNY,EUR,GBP,HKD,IDR,ILS,INR,JPY,MXN,NOK,NZD,PLN,RON,RUB,SEK,SGD,USD,ZAR';

class CoinData {
  Future getCoinData(String nameOfCoin) async {
    List result = [];
    String requestURLBTC = '$coinAPIURLBTC';
    String requestURLETH = '$coinAPIURLETH';
    String requestURLLTC = '$coinAPIURLLTC';
    http.Response responseBTS = await http.get(requestURLBTC);
    http.Response responseETH = await http.get(requestURLETH);
    http.Response responseLTC = await http.get(requestURLLTC);
    if (responseBTS.statusCode == 200 &&
        responseETH.statusCode == 200 &&
        responseLTC.statusCode == 200) {
      var decodeDataBTS = jsonDecode(responseBTS.body);
      var decodeDataETH = jsonDecode(responseETH.body);
      var decodeDataLTC = jsonDecode(responseLTC.body);
      var coinRateBTS = decodeDataBTS['$nameOfCoin'];
      var coinRateETH = decodeDataETH['$nameOfCoin'];
      var coinRateLTC = decodeDataLTC['$nameOfCoin'];
      result.add(coinRateBTS);
      result.add(coinRateETH);
      result.add(coinRateLTC);
      print(result);
      return result;
    } else {
      print(responseBTS.statusCode);
    }
  }
}
