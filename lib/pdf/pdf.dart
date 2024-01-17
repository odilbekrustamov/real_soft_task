import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_soft_task/log_service.dart';
import 'package:share_plus/share_plus.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  String remotePDFpath = "";
  late File file;
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
        file = f;
        isLoading = true;
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      final url =
          "https://customer.stage.realpay.uz/api/customer-mobile/v1/transaction/invoice/pdf/R103G0000144";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Stack(
        children: [
          isLoading
              ? Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _showPdfDialog(context);
                    },
                    child: Text('Open PDF Dialogue'),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
          // errorMessage.isEmpty
          //     ? !isReady
          //         ? Center(
          //             child: CircularProgressIndicator(),
          //           )
          //         : Container()
          //     : Center(
          //         child: Text(errorMessage),
          //       ),
        ],
      ),
      // floatingActionButton: FutureBuilder<PDFViewController>(
      //   future: _controller.future,
      //   builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
      //     if (snapshot.hasData) {
      //       return FloatingActionButton.extended(
      //         label: Text("Go to ${pages! ~/ 2}"),
      //         onPressed: () async {
      //           await snapshot.data!.setPage(pages! ~/ 2);
      //         },
      //       );
      //     }
      //
      //     return Container();
      //   },
      // ),
    );
  }

  Future<void> _showPdfDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _savePdfDialog(context);
                      },
                      child: Text('Save'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _sharePdf(context);
                      },
                      child: Text('Share'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 350,
                    height: 500,
                    child: PDFView(
                      filePath: remotePDFpath,
                      enableSwipe: true,
                      swipeHorizontal: true,
                      autoSpacing: false,
                      pageFling: true,
                      pageSnap: true,
                      defaultPage: currentPage!,
                      fitPolicy: FitPolicy.BOTH,
                      preventLinkNavigation: false,
                      onRender: (_pages) {
                        setState(() {
                          pages = _pages;
                          isReady = true;
                        });
                      },
                      onError: (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                        print(error.toString());
                      },
                      onPageError: (page, error) {
                        setState(() {
                          errorMessage = '$page: ${error.toString()}';
                        });
                        print('$page: ${error.toString()}');
                      },
                      onViewCreated: (PDFViewController pdfViewController) {
                        _controller.complete(pdfViewController);
                      },
                      onLinkHandler: (String? uri) {
                        print('goto uri: $uri');
                      },
                      onPageChanged: (int? page, int? total) {
                        print('page change: $page/$total');
                        setState(() {
                          currentPage = page;
                        });
                      },
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _savePdfDialog(BuildContext context) async {
    TextEditingController fileNameController = TextEditingController();
    bool isSaving = false;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Enter PDF File Name'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: fileNameController,
                    decoration: InputDecoration(labelText: 'File Name'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isSaving
                        ? null
                        : () async {
                      if (fileNameController.text.isNotEmpty) {
                        setState(() {
                          isSaving = true;
                        });
                        await _savePdfWithName(
                            context, fileNameController.text);
                        Navigator.pop(context);
                      } else {
                        // Show error message or handle accordingly
                        print('Please enter a file name');
                      }
                    },
                    child: isSaving
                        ? CircularProgressIndicator()
                        : Text('Save'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _savePdfWithName(BuildContext context, String fileName) async {
    try {
      if (remotePDFpath.isNotEmpty) {
        var customDir = Directory('/storage/emulated/0/RealSoftTask/File');
        LogService.e(customDir.path);
        if (!await customDir.exists()) {
          await customDir.create(recursive: true);
        }

        var newPathAndFilename = '${customDir.path}/$fileName.pdf';
        await file.copy(newPathAndFilename);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('PDF saved to $newPathAndFilename'),
        ));
      } else {
        print("PDF file not available.");
      }
    } catch (e) {
      print("Error saving PDF: $e");
    }
  }

  void _sharePdf(BuildContext context) {
    LogService.e(remotePDFpath);
    if (remotePDFpath.isNotEmpty) {
      Share.shareFiles(['${file.path}'],
          text: 'PDF!',
          subject: 'Sharing PDF File',
          mimeTypes: ['application/pdf']);
    } else {
      print("PDF file not available.");
    }
  }
}
