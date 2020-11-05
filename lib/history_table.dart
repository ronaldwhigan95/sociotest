import 'package:moor/moor.dart';
part 'history_table.g.dart';

class HistoryTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get seldateTime => dateTime()();
}

@UseMoor(tables: [HistoryTable])
class MyDatabase {}
