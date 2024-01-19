import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/utils/urls.dart';
import 'package:frontend/utils/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ClubAdsAdd extends StatefulWidget {
  const ClubAdsAdd({super.key});

  @override
  State<ClubAdsAdd> createState() => _ClubAdsAddState();
}

class _ClubAdsAddState extends State<ClubAdsAdd> {
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  double long = 0;
  double lat = 0;
  dynamic responseData = [];
  Widget suggestedAddresses = const Center(
    child: Text('No address found'),
  );

  void fetchAddress(input) async {
    final api = Uri.parse(apiUrl.replaceAll('placeName', input));
    final response = await http.get(api);
    if (response.statusCode == 200) {
      setState(() {
        responseData = json.decode(response.body)['features'];
      });
      if (responseData.isEmpty) {
        return;
      } else {
        setState(() {
          suggestedAddresses = ListView.builder(
            itemCount: responseData.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  _addressController.text = responseData[index]['properties']
                      ['GeocoderMetaData']['text'];
                  long = responseData[index]['geometry']['coordinates'][0];
                  lat = responseData[index]['geometry']['coordinates'][1];
                  suggestedAddresses = const SizedBox();
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    responseData[index]['properties']['GeocoderMetaData']
                        ['text'],
                  ),
                  const Divider(height: 1),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          );
        });
      }
    }
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final api = Uri.parse(adsSaveApi);

      const headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

      final body = json.encode({
        'title': _title,
        'description': _description,
        'lot': long,
        'lat': lat
      });

      final response = await http.post(
        api,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 201 && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.succesfullyAdded),
          ),
        );
      } else {
        print(response.body);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.xmark),
            ),
            const SizedBox(width: 10),
            Text(AppLocalizations.of(context)!.newAds),
            const Spacer(),
            IconButton(
              onPressed: _save,
              icon: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.title),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.requiredField;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _title = value!;
                      },
                      decoration: customInputStyle(
                        context,
                        AppLocalizations.of(context)!.enterTitle,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(AppLocalizations.of(context)!.description),
                    TextFormField(
                      maxLines: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.requiredField;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _description = value!;
                      },
                      decoration: customInputStyle(
                        context,
                        AppLocalizations.of(context)!.enterDescription,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            height: 1,
                            color: const Color(0xFF01001F),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            AppLocalizations.of(context)!.changeLocation,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Container(
                            height: 1,
                            color: const Color(0xFF01001F),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    Text(AppLocalizations.of(context)!.addressByLocation),
                    TextFormField(
                      controller: _addressController,
                      onChanged: (value) {
                        fetchAddress(value);
                      },
                      decoration: customInputStyle(
                        context,
                        AppLocalizations.of(context)!.enterMap,
                      ),
                    ),
                    SizedBox(
                      height: 600,
                      child: suggestedAddresses,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
