// Future<void> makeBamboraRequest() async {
//
//   String merchantId = 'your_merchant_id';
//   String apiKey = 'your_api_key';
//
//   String passcode = '$merchantId:$apiKey';
//   String passcodeEncoded = base64Encode(utf8.encode(passcode));
//
//   String url = 'https://api_endpoint_here';
//
//   Map<String, String> headers = {
//     'Authorization': 'Passcode $passcodeEncoded',
//     'Content-Type': 'application/json',
//   };
//   // Prepare the JSON body
//   Map<String, dynamic> jsonBody = {
//     "amount": 100.00,
//     "payment_method": "card",
//     "card": {
//       "name": "John Doe",
//       "number": "4030000010001234",
//       "expiry_month": "02",
//       "expiry_year": "14",
//       "cvd": "123",
//     },
//   };
//   // Serialize the JSON body
//   String body = json.encode(jsonBody);
//   // Make the API request
//   http.Response response = await http.post(Uri.parse(url), headers: headers, body: body);
//   // Process the response as needed
//   if (response.statusCode == 200) {
//     print('Successful response: ${response.body}');
//   } else {
//     print('Error: ${response.statusCode} ${response.reasonPhrase}');
//   }
// }