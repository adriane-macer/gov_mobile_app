// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) {
  return Bill(
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

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
  'category': instance.category,
  'kind': instance.kind,
  'name': instance.name,
  'rate': instance.rate,
  'previous_reading': instance.previousReading,
  'present_reading': instance.presentReading,
  'consumption': instance.consumption,
  'start': instance.start,
  'end': instance.end,
  'contract': instance.contract,
};
