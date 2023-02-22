import 'dart:convert';
import 'dart:io';

void main() async {
  File file = new File('test.txt');
  String content = 'The easiest way to write text to a file is to crate a File';

  try {
    await file.writeAsString(content, flush: true, encoding: utf8);
    print('Data writeen');
  } catch (e) {
    print('$e');
  }

  File readFile = new File('test.txt');
  try {
    String content = await readFile.readAsString();
    print(content);
  } catch (e) {
    print(e);
  }
}
