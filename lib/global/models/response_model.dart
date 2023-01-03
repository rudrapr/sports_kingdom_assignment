class ResponseModel {
  Time? time;
  String? disclaimer;
  String? chartName;
  Bpi? bpi;

  ResponseModel({this.time, this.disclaimer, this.chartName, this.bpi});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    disclaimer = json['disclaimer'];
    chartName = json['chartName'];
    bpi = json['bpi'] != null ? Bpi.fromJson(json['bpi']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (time != null) {
      data['time'] = time!.toJson();
    }
    data['disclaimer'] = disclaimer;
    data['chartName'] = chartName;
    if (bpi != null) {
      data['bpi'] = bpi!.toJson();
    }
    return data;
  }
}

class Time {
  String? updated;
  String? updatedISO;
  String? updateduk;

  Time({this.updated, this.updatedISO, this.updateduk});

  Time.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    updatedISO = json['updatedISO'];
    updateduk = json['updateduk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['updated'] = updated;
    data['updatedISO'] = updatedISO;
    data['updateduk'] = updateduk;
    return data;
  }
}

class Bpi {
  Currency? uSD;
  Currency? gBP;
  Currency? eUR;

  Bpi({this.uSD, this.gBP, this.eUR});

  Bpi.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? Currency.fromJson(json['USD']) : null;
    gBP = json['GBP'] != null ? Currency.fromJson(json['GBP']) : null;
    eUR = json['EUR'] != null ? Currency.fromJson(json['EUR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    if (gBP != null) {
      data['GBP'] = gBP!.toJson();
    }
    if (eUR != null) {
      data['EUR'] = eUR!.toJson();
    }
    return data;
  }
}

class Currency {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  Currency({this.code, this.symbol, this.rate, this.description, this.rateFloat});

  Currency.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    rate = json['rate'];
    description = json['description'];
    rateFloat = json['rate_float'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['symbol'] = symbol;
    data['rate'] = rate;
    data['description'] = description;
    data['rate_float'] = rateFloat;
    return data;
  }
}
