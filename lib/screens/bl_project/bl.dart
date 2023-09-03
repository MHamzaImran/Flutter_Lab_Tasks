import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

class BluetoothDeviceScreen extends StatefulWidget {
  const BluetoothDeviceScreen({Key? key}) : super(key: key);

  @override
  BluetoothDeviceScreenState createState() => BluetoothDeviceScreenState();
}

class BluetoothDeviceScreenState extends State<BluetoothDeviceScreen> {
  final _ble = FlutterReactiveBle();

  final List<DiscoveredDevice> _devices = [];

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final permissionStatus = await Permission.bluetooth.request();
    final locationPermissionStatus = await Permission.location.request();

    if (permissionStatus.isDenied || locationPermissionStatus.isDenied) {
      // Handle permission denied
    } else {
      _startDeviceDiscovery();
    }
  }

  Future<void> _startDeviceDiscovery() async {
    _ble
        .scanForDevices(withServices: [], scanMode: ScanMode.lowLatency)
        .listen((device) {
      setState(() {
        _devices.add(device);
        print('==========');
      });
    }, onError: (error) {
      // Handle device discovery error
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Devices'),
      ),
      body: ListView.builder(
        itemCount: _devices.length,
        itemBuilder: (context, index) {
          final device = _devices[index];
          return ListTile(
            title: Text(device.name),
            subtitle: Text(device.id),
            onTap: () {
              // Handle device selection
            },
          );
        },
      ),
    );
  }
}
