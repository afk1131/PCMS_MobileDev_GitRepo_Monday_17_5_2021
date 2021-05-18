class LoginResponse {
  String customerID;
  String customerName;
  String lastLogin;
  String isFirstLogin;
  String institutionID;
  String currentSessionID;
  String baseCurrCode;
  String baseCurrDesc;

  LoginResponse(
      {this.customerID,
      this.customerName,
      this.lastLogin,
      this.isFirstLogin,
      this.institutionID,
      this.currentSessionID,
      this.baseCurrCode,
      this.baseCurrDesc});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    customerID = json['CustomerID'];
    customerName = json['CustomerName'];
    lastLogin = json['LastLogin'];
    isFirstLogin = json['IsFirstLogin'];
    institutionID = json['InstitutionID'];
    currentSessionID = json['CurrentSessionID'];
    baseCurrCode = json['BaseCurrCode'];
    baseCurrDesc = json['BaseCurrDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerID'] = this.customerID;
    data['CustomerName'] = this.customerName;
    data['LastLogin'] = this.lastLogin;
    data['IsFirstLogin'] = this.isFirstLogin;
    data['InstitutionID'] = this.institutionID;
    data['CurrentSessionID'] = this.currentSessionID;
    data['BaseCurrCode'] = this.baseCurrCode;
    data['BaseCurrDesc'] = this.baseCurrDesc;
    return data;
  }
}
