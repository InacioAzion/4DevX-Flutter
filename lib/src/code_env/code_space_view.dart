import 'code_http_request.dart';
import 'custom_code_box.dart';
// import 'package:example/readme/readme_examples.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CodeSpaceView extends StatefulWidget {
  CodeSpaceView({Key? key}) : super(key: key);

  static const routeName = '/';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<CodeSpaceView> {
  String _requestSelected = 'get';
  String _url = '';
  String _key = '';
  String _value = '';
  String _response = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextEditingController userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const preset = "javascript|a11y-light";
    final parts = preset.split('|');

    return Scaffold(
        //backgroundColor: const Color(0xFF363636),
        appBar: AppBar(
          backgroundColor: const Color(0xff23241f),
          foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
          title: const Text("Azion"),
          centerTitle: false,
        ),
        body: Center(
            child: Row(children: [
          Expanded(
            child: Container(
                constraints: const BoxConstraints(maxWidth: 800),
                padding: const EdgeInsets.fromLTRB(5, 40, 0, 20),
                child: CustomCodeBox(
                  language: parts[0],
                  theme: parts[1],
                )),
          ),
          Expanded(
              child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: DropdownButton<String>(
                                  value: _requestSelected,
                                  icon: const Icon(Icons.arrow_downward),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _requestSelected = newValue!;
                                    });
                                  },
                                  items: const [
                                    DropdownMenuItem(
                                        child: Text('Get'), value: 'get'),
                                    DropdownMenuItem(
                                        child: Text('Post'), value: 'post')
                                  ],
                                ),
                              )),
                          Flexible(
                            flex: 6,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: TextFormField(
                                controller: userInput,
                                onChanged: (value) {
                                  setState(() {
                                    _url = value;
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText:
                                      //'https://azion.com/functions/sum/x=2&y=2',
                                      'URL',
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: ElevatedButton(
                                  child: const Text(
                                    "Send",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: _send,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Header",
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        _key = value;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      labelText: '  Key',
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      labelText: '  Value',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Center(
                            child: ElevatedButton(
                              child: Icon(Icons.add_circle),
                              onPressed: null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 40, 10, 20),
              child: Column(
                children: [
                  Flexible(
                      flex: 2,
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 240),
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(_response),
                      )),
                ],
              ),
            ),
          )
        ])));
  }

  _send() {
    //exec request
    // Map<String, String> headers = {
    //   _key: _value,
    // };
    getHttp(_url).then((value) => {
          setState(() async {
            _response = value;
          })
        });
  }
}
