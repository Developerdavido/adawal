

/// This dto is used to get the address information
/// from the blockfrost API
library;

class Address {
  String? address;
  List<Amount>? amount;
  String? stakeAddress;
  String? type;
  bool? script;

  Address({
    this.address,
    this.amount,
    this.stakeAddress,
    this.type,
    this.script,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    amount: json["amount"] == null ? [] : List<Amount>.from(json["amount"]!.map((x) => Amount.fromJson(x))),
    stakeAddress: json["stake_address"],
    type: json["type"],
    script: json["script"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "amount": amount == null ? [] : List<dynamic>.from(amount!.map((x) => x.toJson())),
    "stake_address": stakeAddress,
    "type": type,
    "script": script,
  };
}

class Amount {
  String? unit;
  String? quantity;

  Amount({
    this.unit,
    this.quantity,
  });

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
    unit: json["unit"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "unit": unit,
    "quantity": quantity,
  };
}
