library my_prj.globals;

import 'package:data_serializer/data_serializer.dart';
List<dynamic>? ports;
var portName;
var weight;
var reader;
var buffer = BytesBuffer(256);
bool isBegin = false;
bool isFallDown = false;