part 'bill.g.dart';

class Bill {
  final category;
  final kind;
  final name;
  final rate;
  final previousReading;
  final presentReading;
  final consumption;
  final start;
  final end;
  final contract;

  Bill(
      this.category,
      this.kind,
      this.name,
      this.rate,
      this.previousReading,
      this.presentReading,
      this.consumption,
      this.start,
      this.end,
      this.contract);

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
        json['category'],
        json['kind'],
        json['name'],
        json['rate'],
        json['previous_reading'],
        json['present_reading'],
        json['consumption'],
        json['start'],
        json['end'],
        json['contract'],
      );
}
