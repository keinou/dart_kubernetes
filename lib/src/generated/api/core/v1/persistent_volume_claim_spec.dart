import 'package:kubernetes/src/generated/api/core/v1/typed_local_object_reference.dart';
import 'package:kubernetes/src/generated/api/core/v1/resource_requirements.dart';
import 'package:kubernetes/src/generated/apimachinery/pkg/apis/meta/v1/label_selector.dart';

/// PersistentVolumeClaimSpec describes the common attributes of storage devices and allows a Source for provider-specific attributes.
class PersistentVolumeClaimSpec {
  /// The main constructor.
  const PersistentVolumeClaimSpec({
    this.accessModes,
    this.dataSource,
    this.dataSourceRef,
    this.resources,
    this.selector,
    this.storageClassName,
    this.volumeMode,
    this.volumeName,
  });

  /// Creates a PersistentVolumeClaimSpec from JSON data.
  PersistentVolumeClaimSpec.fromJson(Map<String, dynamic> json)
      : this(
          accessModes: json['accessModes'] != null
              ? List<String>.from(json['accessModes'])
              : null,
          dataSource: json['dataSource'] != null
              ? TypedLocalObjectReference.fromJson(json['dataSource'])
              : null,
          dataSourceRef: json['dataSourceRef'] != null
              ? TypedLocalObjectReference.fromJson(json['dataSourceRef'])
              : null,
          resources: json['resources'] != null
              ? ResourceRequirements.fromJson(json['resources'])
              : null,
          selector: json['selector'] != null
              ? LabelSelector.fromJson(json['selector'])
              : null,
          storageClassName: json['storageClassName'],
          volumeMode: json['volumeMode'],
          volumeName: json['volumeName'],
        );

  /// Creates a list of PersistentVolumeClaimSpec from JSON data.
  static List<PersistentVolumeClaimSpec> listFromJson(
      Iterable<Map<String, dynamic>> list) {
    return list.map((e) => PersistentVolumeClaimSpec.fromJson(e)).toList();
  }

  /// Converts a PersistentVolumeClaimSpec instance to JSON data.
  Map<String, Object> toJson() {
    final jsonData = <String, Object>{};

    if (accessModes != null) {
      jsonData['accessModes'] = accessModes!;
    }
    if (dataSource != null) {
      jsonData['dataSource'] = dataSource!.toJson();
    }
    if (dataSourceRef != null) {
      jsonData['dataSourceRef'] = dataSourceRef!.toJson();
    }
    if (resources != null) {
      jsonData['resources'] = resources!.toJson();
    }
    if (selector != null) {
      jsonData['selector'] = selector!.toJson();
    }
    if (storageClassName != null) {
      jsonData['storageClassName'] = storageClassName!;
    }
    if (volumeMode != null) {
      jsonData['volumeMode'] = volumeMode!;
    }
    if (volumeName != null) {
      jsonData['volumeName'] = volumeName!;
    }

    return jsonData;
  }

  /// AccessModes contains the desired access modes the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1.
  final List<String>? accessModes;

  /// This field can be used to specify either: * An existing VolumeSnapshot object (snapshot.storage.k8s.io/VolumeSnapshot) * An existing PVC (PersistentVolumeClaim) If the provisioner or an external controller can support the specified data source, it will create a new volume based on the contents of the specified data source. If the AnyVolumeDataSource feature gate is enabled, this field will always have the same contents as the DataSourceRef field.
  final TypedLocalObjectReference? dataSource;

  /// Specifies the object from which to populate the volume with data, if a non-empty volume is desired. This may be any local object from a non-empty API group (non core object) or a PersistentVolumeClaim object. When this field is specified, volume binding will only succeed if the type of the specified object matches some installed volume populator or dynamic provisioner. This field will replace the functionality of the DataSource field and as such if both fields are non-empty, they must have the same value. For backwards compatibility, both fields (DataSource and DataSourceRef) will be set to the same value automatically if one of them is empty and the other is non-empty. There are two important differences between DataSource and DataSourceRef: * While DataSource only allows two specific types of objects, DataSourceRef
  ///   allows any non-core object, as well as PersistentVolumeClaim objects.
  /// * While DataSource ignores disallowed values (dropping them), DataSourceRef
  ///   preserves all values, and generates an error if a disallowed value is
  ///   specified.
  /// (Alpha) Using this field requires the AnyVolumeDataSource feature gate to be enabled.
  final TypedLocalObjectReference? dataSourceRef;

  /// Resources represents the minimum resources the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources.
  final ResourceRequirements? resources;

  /// A label query over volumes to consider for binding.
  final LabelSelector? selector;

  /// Name of the StorageClass required by the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1.
  final String? storageClassName;

  /// VolumeMode defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec.
  final String? volumeMode;

  /// VolumeName is the binding reference to the PersistentVolume backing this claim.
  final String? volumeName;
}
