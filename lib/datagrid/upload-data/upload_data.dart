import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  PlatformFile? objFile;

  void chooseFileUsingFilePicker()async{
    var result = await FilePicker.platform.pickFiles(
        withReadStream: true
    );
    if(result != null){
      setState(() {
        objFile = result.files.single;
      });
    }
  }

  void uploadSelectedFileInstaHyre() async {

    final request = http.MultipartRequest(
      "POST",
      Uri.parse("http://127.0.0.1:5000/getfile/instahyrefile"),
    );


    request.files.add(http.MultipartFile(
        "file",
        (objFile!.readStream)!,
        objFile!.size,
        filename: objFile!.name
    ));


    var resp = await request.send();

    String result = await resp.stream.bytesToString();

    print(result);
  }
  void uploadSelectedFileNaukri() async {

    final request = http.MultipartRequest(
      "POST",
      Uri.parse("http://127.0.0.1:5000/getfile/naukrifile"),
    );


    request.files.add(http.MultipartFile(
        "file",
        (objFile!.readStream)!,
        objFile!.size,
        filename: objFile!.name
    ));


    var resp = await request.send();

    String result = await resp.stream.bytesToString();

    print(result);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                child: const Text(
                  'Choose File',
                ),
                onPressed: () => chooseFileUsingFilePicker()
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => uploadSelectedFileInstaHyre(),
                    child: const Text(
                        'Upload From InstaHyre'
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () => uploadSelectedFileNaukri(),
                    child: const Text(
                        'Upload From Naukri.Com'
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
