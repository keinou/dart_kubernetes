import 'package:kubernetes/src/generated/apimachinery/pkg/apis/meta/v1/label_selector.dart';
import 'package:kubernetes/src/generated/api/autoscaling/v2beta1/cross_version_object_reference.dart';

/// ObjectMetricSource indicates how to scale on a metric describing a kubernetes object (for example, hits-per-second on an Ingress object).
class ObjectMetricSource {
  /// The main constructor.
  const ObjectMetricSource({
    this.averageValue,
    required this.metricName,
    this.selector,
    required this.target,
    required this.targetValue,
  });

  /// Creates a ObjectMetricSource from JSON data.
  ObjectMetricSource.fromJson(Map<String, dynamic> json)
      : this(
          averageValue: json['averageValue'],
          metricName: json['metricName'],
          selector: json['selector'] != null
              ? LabelSelector.fromJson(json['selector'])
              : null,
          target: CrossVersionObjectReference.fromJson(json['target']),
          targetValue: json['targetValue'],
        );

  /// Creates a list of ObjectMetricSource from JSON data.
  static List<ObjectMetricSource> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => ObjectMetricSource.fromJson(e)).toList();
  }

  /// Converts a ObjectMetricSource instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    if (averageValue != null) {
      jsonData['averageValue'] = averageValue!;
    }
    jsonData['metricName'] = metricName;
    if (selector != null) {
      jsonData['selector'] = selector!.toJson();
    }
    jsonData['target'] = target.toJson();
    jsonData['targetValue'] = targetValue;

    return jsonData;
  }

  /// AverageValue is the target value of the average of the metric across all relevant pods (as a quantity).
  final String? averageValue;

  /// MetricName is the name of the metric in question.
  final String metricName;

  /// Selector is the string-encoded form of a standard kubernetes label selector for the given metric When set, it is passed as an additional parameter to the metrics server for more specific metrics scoping When unset, just the metricName will be used to gather metrics.
  final LabelSelector? selector;

  /// Target is the described Kubernetes object.
  final CrossVersionObjectReference target;

  /// TargetValue is the target value of the metric (as a quantity).
  final String targetValue;
}
