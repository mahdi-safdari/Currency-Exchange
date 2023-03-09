// # timestamp : "2022-03-12T09:24:55.291Z"
// # error_code : "0"
// # error_message : "SUCCESS"
// # elapsed : "31"
// # credit_count : 0

class Status {
  final String? timestamp;
  final String? errorCode;
  final String? errorMessage;
  final String? elapsed;
  final int? creditCount;
  const Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      timestamp: json['timestamp'],
      errorCode: json['error_code'],
      errorMessage: json['error_message'],
      elapsed: json['elapsed'],
      creditCount: json['credit_count'],
    );
  }
}
