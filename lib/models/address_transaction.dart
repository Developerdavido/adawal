
class AddressTransaction {
  String? txHash;
  int? txIndex;
  int? blockHeight;
  int? blockTime;

  AddressTransaction({
    this.txHash,
    this.txIndex,
    this.blockHeight,
    this.blockTime,
  });

  factory AddressTransaction.fromJson(Map<String, dynamic> json) => AddressTransaction(
    txHash: json["tx_hash"],
    txIndex: json["tx_index"],
    blockHeight: json["block_height"],
    blockTime: json["block_time"],
  );

  Map<String, dynamic> toJson() => {
    "tx_hash": txHash,
    "tx_index": txIndex,
    "block_height": blockHeight,
    "block_time": blockTime,
  };
}
