import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kubernetes/kubernetes.dart';
import 'package:yakc/dialogs/json_editor_dialog.dart';
import 'package:yakc/views/object_meta_widget.dart';

class DeploymentViewPage extends StatefulWidget {
  const DeploymentViewPage({
    required this.client,
    required this.deployment,
    Key? key,
  }) : super(key: key);

  final KubernetesClient client;
  final Deployment deployment;

  @override
  State<DeploymentViewPage> createState() => _DeploymentViewPageState();
}

class _DeploymentViewPageState extends State<DeploymentViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deployment'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
            onPressed: () {
              const encoder = JsonEncoder.withIndent('  ');
              String prettyprint = encoder.convert(widget.deployment.toJson());
              showDialog(
                context: context,
                builder: (context) => JsonEditorDialog(json: prettyprint),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete',
            onPressed: () {
              //
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(4.0),
        children: [
          if (widget.deployment.metadata != null)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: ObjectMetaWidget(metadata: widget.deployment.metadata!),
              ),
            ),
          if (widget.deployment.spec?.template.spec?.containers != null)
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: Column(
                  children: widget.deployment.spec!.template.spec!.containers
                      .map((e) => ListTile(
                            title: Text(e.name),
                            subtitle: Text(e.image ?? ''),
                          ))
                      .toList(),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                      title: Text(
                          'Replicas: ${widget.deployment.status?.replicas}/${widget.deployment.spec?.replicas}')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
