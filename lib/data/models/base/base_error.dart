/// version : "1.0.0.0"
/// statusCode : 400
/// message : "Unable to process the request."
/// responseException : {"isError":true,"exceptionMessage":"Invalid Email or Password","details":"","referenceErrorCode":"","referenceDocumentLink":"","validationErrors":""}


/// isError : true
/// exceptionMessage : "Invalid Email or Password"
/// details : ""
/// referenceErrorCode : ""
/// referenceDocumentLink : ""
/// validationErrors : ""

class ResponseException {
  ResponseException({
      bool? isError, 
      String? exceptionMessage, 
      String? details, 
      String? referenceErrorCode, 
      String? referenceDocumentLink, 
      String? validationErrors,}){
    _isError = isError;
    _exceptionMessage = exceptionMessage;
    _details = details;
    _referenceErrorCode = referenceErrorCode;
    _referenceDocumentLink = referenceDocumentLink;
    _validationErrors = validationErrors;
}

  ResponseException.fromJson(dynamic json) {
    _isError = json['isError'];
    _exceptionMessage = json['exceptionMessage'];
    _details = json['details'];
    _referenceErrorCode = json['referenceErrorCode'];
    _referenceDocumentLink = json['referenceDocumentLink'];
    _validationErrors = json['validationErrors'];
  }
  bool? _isError;
  String? _exceptionMessage;
  String? _details;
  String? _referenceErrorCode;
  String? _referenceDocumentLink;
  String? _validationErrors;

  bool? get isError => _isError;
  String? get exceptionMessage => _exceptionMessage;
  String? get details => _details;
  String? get referenceErrorCode => _referenceErrorCode;
  String? get referenceDocumentLink => _referenceDocumentLink;
  String? get validationErrors => _validationErrors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isError'] = _isError;
    map['exceptionMessage'] = _exceptionMessage;
    map['details'] = _details;
    map['referenceErrorCode'] = _referenceErrorCode;
    map['referenceDocumentLink'] = _referenceDocumentLink;
    map['validationErrors'] = _validationErrors;
    return map;
  }

}