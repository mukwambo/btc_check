import 'dart:convert';

import 'package:http/http.dart' as http;

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

const baseCurrency = 'BTC';
const quoteCurrency = 'USD';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'YOUR-API-KEY';

class CoinData {
  // This method pulls the exchange rate data from an api
  Future getCoinData() async {
    final url =
        Uri.parse('$coinAPIURL/$baseCurrency/$quoteCurrency?apikey=$apiKey');
    // Since this may take long to load the data, we make the function an async
    http.Response response = await http.get(url);
    // Check if the status code is 200 (request successful) otherwise we print the stats code
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var coinPrice = decodedData['rate'];
      return coinPrice;
    } else {
      print(response.statusCode);
    }
  }
}
