import 'package:collection/collection.dart';

enum VideoRenderingStates {
  waiting_to_start,
  rendering,
  success_render,
  failed_render,
}

enum SortOrders {
  ASCENDING,
  DESCENDING,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (VideoRenderingStates):
      return VideoRenderingStates.values.deserialize(value) as T?;
    case (SortOrders):
      return SortOrders.values.deserialize(value) as T?;
    default:
      return null;
  }
}
