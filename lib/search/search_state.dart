import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:real_soft_task/search/state/state_date.dart';

import '../log_service.dart';

class SearchState extends StatefulWidget {
  const SearchState({super.key});

  @override
  State<SearchState> createState() => _SearchStateState();
}

class _SearchStateState extends State<SearchState> {
  late StateDate stateDate;

  Future<void> initializeStateDate() async {
    String jsonString =
        await rootBundle.loadString('assets/files/uzbek.json');
    stateDate = stateDateFromJson(jsonString);
    LogService.i(stateDate.data.length.toString());
  }

  @override
  void initState() {
    super.initState();
    initializeStateDate().then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Davlatlar'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(40, 80, 40, 0),
              child: TypeAheadField(
                // textFieldConfiguration: TextFieldConfiguration(
                //   decoration: InputDecoration(labelText: 'Search by ID'),
                // ),
                suggestionsCallback: (pattern) async {
                  List<Datum> suggestions = stateDate.data
                      .where((date) => date.id.toString().startsWith(pattern))
                      .toList();
                  return suggestions;
                },
                itemBuilder: (context, Datum suggestion) {
                  return ListTile(
                    title: Text(suggestion.name),
                    subtitle: Text('ID: ${suggestion.id}'),
                  );
                },
                // onSuggestionSelected: (Datum suggestion) {
                //   // Handle when a suggestion is selected
                //   print('Selected: ${suggestion.name} - ${suggestion.id}');
                // },
                onSelected: (Datum value) {  },
              ),
            )
          ],
        ),
      ),
    );
  }
}
