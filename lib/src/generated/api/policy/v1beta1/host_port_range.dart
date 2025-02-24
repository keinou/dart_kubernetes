/// HostPortRange defines a range of host ports that will be enabled by a policy for pods to use.  It requires both the start and end to be defined.
class HostPortRange {
  /// The main constructor.
  const HostPortRange({
    required this.max,
    required this.min,
  });

  /// Creates a HostPortRange from JSON data.
  HostPortRange.fromJson(Map<String, dynamic> json)
      : this(
          max: json['max'],
          min: json['min'],
        );

  /// Creates a list of HostPortRange from JSON data.
  static List<HostPortRange> listFromJson(Iterable<Map<String, dynamic>> list) {
    return list.map((e) => HostPortRange.fromJson(e)).toList();
  }

  /// Converts a HostPortRange instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    jsonData['max'] = max;
    jsonData['min'] = min;

    return jsonData;
  }

  /// Max is the end of the range, inclusive.
  final int max;

  /// Min is the start of the range, inclusive.
  final int min;
}
