import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

createPaymentIntent(String amount, String currency) async {
  Dio dio = Dio();
  try {
    //Request body
    Map<String, dynamic> body = {
      'amount': calculateAmount(amount),
      'currency': currency,
    };

    //Make post request to Stripe
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: body,
    );
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    }
  } catch (err) {
    throw Exception(err.toString());
  }
}

calculateAmount(String amount) {
  final calculatedAmout = (int.parse(amount)) * 100;
  return calculatedAmout.toString();
}
