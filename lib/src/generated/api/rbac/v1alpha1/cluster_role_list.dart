import 'package:kubernetes/src/generated/api/rbac/v1alpha1/cluster_role.dart';
import 'package:kubernetes/src/generated/apimachinery/pkg/apis/meta/v1/list_meta.dart';

/// ClusterRoleList is a collection of ClusterRoles. Deprecated in v1.17 in favor of rbac.authorization.k8s.io/v1 ClusterRoles, and will no longer be served in v1.22.
class ClusterRoleList {
  /// The main constructor.
  const ClusterRoleList({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  /// Creates a ClusterRoleList from JSON data.
  ClusterRoleList.fromJson(Map<String, dynamic> json)
      : this(
          apiVersion: json['apiVersion'],
          items: json['items'] != null
              ? ClusterRole.listFromJson(
                  (json['items'] as Iterable).cast<Map<String, dynamic>>())
              : [],
          kind: json['kind'],
          metadata: json['metadata'] != null
              ? ListMeta.fromJson(json['metadata'])
              : null,
        );

  /// Creates a list of ClusterRoleList from JSON data.
  static List<ClusterRoleList> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => ClusterRoleList.fromJson(e)).toList();
  }

  /// Converts a ClusterRoleList instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    if (apiVersion != null) {
      jsonData['apiVersion'] = apiVersion!;
    }
    jsonData['items'] = items.map((item) => item.toJson()).toList();
    if (kind != null) {
      jsonData['kind'] = kind!;
    }
    if (metadata != null) {
      jsonData['metadata'] = metadata!.toJson();
    }

    return jsonData;
  }

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources.
  final String? apiVersion;

  /// Items is a list of ClusterRoles.
  final List<ClusterRole> items;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds.
  final String? kind;

  /// Standard object's metadata.
  final ListMeta? metadata;
}
