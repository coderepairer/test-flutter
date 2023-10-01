import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextDataRecord extends FirestoreRecord {
  TextDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  bool hasSender() => _sender != null;

  // "recipient" field.
  String? _recipient;
  String get recipient => _recipient ?? '';
  bool hasRecipient() => _recipient != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  bool hasScore() => _score != null;

  // "fraud_threat" field.
  bool? _fraudThreat;
  bool get fraudThreat => _fraudThreat ?? false;
  bool hasFraudThreat() => _fraudThreat != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _sender = snapshotData['sender'] as String?;
    _recipient = snapshotData['recipient'] as String?;
    _body = snapshotData['body'] as String?;
    _score = castToType<double>(snapshotData['score']);
    _fraudThreat = snapshotData['fraud_threat'] as bool?;
    _type = snapshotData['type'] as String?;
    _timestamp = snapshotData['timestamp'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('text_data');

  static Stream<TextDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TextDataRecord.fromSnapshot(s));

  static Future<TextDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TextDataRecord.fromSnapshot(s));

  static TextDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TextDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TextDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TextDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TextDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TextDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTextDataRecordData({
  String? sender,
  String? recipient,
  String? body,
  double? score,
  bool? fraudThreat,
  String? type,
  String? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'recipient': recipient,
      'body': body,
      'score': score,
      'fraud_threat': fraudThreat,
      'type': type,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class TextDataRecordDocumentEquality implements Equality<TextDataRecord> {
  const TextDataRecordDocumentEquality();

  @override
  bool equals(TextDataRecord? e1, TextDataRecord? e2) {
    return e1?.sender == e2?.sender &&
        e1?.recipient == e2?.recipient &&
        e1?.body == e2?.body &&
        e1?.score == e2?.score &&
        e1?.fraudThreat == e2?.fraudThreat &&
        e1?.type == e2?.type &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(TextDataRecord? e) => const ListEquality().hash([
        e?.sender,
        e?.recipient,
        e?.body,
        e?.score,
        e?.fraudThreat,
        e?.type,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is TextDataRecord;
}
