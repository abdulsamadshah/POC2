///
/// Class for manages execption during API Calls
///
class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

///
/// Execption during fetch data from server
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

///
/// Execption during send bad request or parameter missing
class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

///
/// Execption during fetching unauthorised data
class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

///
/// Execption during giving invalidinput to server
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
