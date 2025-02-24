import 'package:kubernetes/src/generated/apimachinery/pkg/apis/meta/v1/object_meta.dart';
import 'package:kubernetes/src/generated/apimachinery/pkg/apis/meta/v1/label_selector.dart';

/// CSIStorageCapacity stores the result of one CSI GetCapacity call. For a given StorageClass, this describes the available capacity in a particular topology segment.  This can be used when considering where to instantiate new PersistentVolumes.
///
/// For example this can express things like: - StorageClass "standard" has "1234 GiB" available in "topology.kubernetes.io/zone=us-east1" - StorageClass "localssd" has "10 GiB" available in "kubernetes.io/hostname=knode-abc123"
///
/// The following three cases all imply that no capacity is available for a certain combination: - no object exists with suitable topology and storage class name - such an object exists, but the capacity is unset - such an object exists, but the capacity is zero
///
/// The producer of these objects can decide which approach is more suitable.
///
/// They are consumed by the kube-scheduler if the CSIStorageCapacity beta feature gate is enabled there and a CSI driver opts into capacity-aware scheduling with CSIDriver.StorageCapacity.
class CSIStorageCapacity {
  /// The main constructor.
  const CSIStorageCapacity({
    this.apiVersion,
    this.capacity,
    this.kind,
    this.maximumVolumeSize,
    this.metadata,
    this.nodeTopology,
    required this.storageClassName,
  });

  /// Creates a CSIStorageCapacity from JSON data.
  CSIStorageCapacity.fromJson(Map<String, dynamic> json)
      : this(
          apiVersion: json['apiVersion'],
          capacity: json['capacity'],
          kind: json['kind'],
          maximumVolumeSize: json['maximumVolumeSize'],
          metadata: json['metadata'] != null
              ? ObjectMeta.fromJson(json['metadata'])
              : null,
          nodeTopology: json['nodeTopology'] != null
              ? LabelSelector.fromJson(json['nodeTopology'])
              : null,
          storageClassName: json['storageClassName'],
        );

  /// Creates a list of CSIStorageCapacity from JSON data.
  static List<CSIStorageCapacity> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => CSIStorageCapacity.fromJson(e)).toList();
  }

  /// Converts a CSIStorageCapacity instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    if (apiVersion != null) {
      jsonData['apiVersion'] = apiVersion!;
    }
    if (capacity != null) {
      jsonData['capacity'] = capacity!;
    }
    if (kind != null) {
      jsonData['kind'] = kind!;
    }
    if (maximumVolumeSize != null) {
      jsonData['maximumVolumeSize'] = maximumVolumeSize!;
    }
    if (metadata != null) {
      jsonData['metadata'] = metadata!.toJson();
    }
    if (nodeTopology != null) {
      jsonData['nodeTopology'] = nodeTopology!.toJson();
    }
    jsonData['storageClassName'] = storageClassName;

    return jsonData;
  }

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources.
  final String? apiVersion;

  /// Capacity is the value reported by the CSI driver in its GetCapacityResponse for a GetCapacityRequest with topology and parameters that match the previous fields.
  ///
  /// The semantic is currently (CSI spec 1.2) defined as: The available capacity, in bytes, of the storage that can be used to provision volumes. If not set, that information is currently unavailable and treated like zero capacity.
  final String? capacity;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds.
  final String? kind;

  /// MaximumVolumeSize is the value reported by the CSI driver in its GetCapacityResponse for a GetCapacityRequest with topology and parameters that match the previous fields.
  ///
  /// This is defined since CSI spec 1.4.0 as the largest size that may be used in a CreateVolumeRequest.capacity_range.required_bytes field to create a volume with the same parameters as those in GetCapacityRequest. The corresponding value in the Kubernetes API is ResourceRequirements.Requests in a volume claim.
  final String? maximumVolumeSize;

  /// Standard object's metadata. The name has no particular meaning. It must be be a DNS subdomain (dots allowed, 253 characters). To ensure that there are no conflicts with other CSI drivers on the cluster, the recommendation is to use csisc-<uuid>, a generated name, or a reverse-domain name which ends with the unique CSI driver name.
  ///
  /// Objects are namespaced.
  ///
  /// More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata.
  final ObjectMeta? metadata;

  /// NodeTopology defines which nodes have access to the storage for which capacity was reported. If not set, the storage is not accessible from any node in the cluster. If empty, the storage is accessible from all nodes. This field is immutable.
  final LabelSelector? nodeTopology;

  /// The name of the StorageClass that the reported capacity applies to. It must meet the same requirements as the name of a StorageClass object (non-empty, DNS subdomain). If that object no longer exists, the CSIStorageCapacity object is obsolete and should be removed by its creator. This field is immutable.
  final String storageClassName;
}
