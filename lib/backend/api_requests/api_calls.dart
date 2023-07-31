import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateIntentCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'createIntent',
      apiUrl: 'https://api.stripe.com/v1/payment_intents',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer sk_test_51NTLuoSEMKklDqJOyDRPP1D2s4jo9aAUKaxuLjpVDdG8ZVQmWhHg8wKRAHuzUXEoTSeIaGOV1rc4RaIs9yHKoI7D00b4oyJCw3',
      },
      params: {
        'amount': 100000,
        'currency': "inr",
        'transfer_data[amount]': 80000,
        'description': "Yolo",
        'transfer_data[destination]': "acct_1NV1GTSEEGf9wt2q",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
