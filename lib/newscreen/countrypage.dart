import 'package:chatapp/Model/countryModel.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key key, this.setCountrycode}) : super(key: key);
  final Function setCountrycode;

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<CountryModel> countries = [
    CountryModel(name: "Nepal", code: "+977", flag: "🇳🇵"),
    CountryModel(name: "India", code: "+91", flag: "🇮🇳"),
    CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    CountryModel(name: "United States", code: "+1", flag: "🇺🇸"),
    CountryModel(name: "South Africa", code: "+27", flag: "🇿🇦"),
    CountryModel(name: "Afghanistan", code: "+93", flag: "🇦🇫"),
    CountryModel(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    CountryModel(name: "Italy", code: "+39", flag: "🇮🇹"),
    CountryModel(name: "India", code: "+91", flag: "🇮🇳"),
    CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    CountryModel(name: "United States", code: "+1", flag: "🇺🇸"),
    CountryModel(name: "South Africa", code: "+27", flag: "🇿🇦"),
    CountryModel(name: "Afghanistan", code: "+93", flag: "🇦🇫"),
    CountryModel(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    CountryModel(name: "Italy", code: "+39", flag: "🇮🇹"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Choose a country"),
          centerTitle: true,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(icon: Icon(Icons.search), onPressed: () {}))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: countries.length,
                  itemBuilder: (context, index) => card(countries[index]))
            ],
          ),
        ),
      ),
    );
  }

  Widget card(CountryModel country) {
    return InkWell(
      onTap: () {
        widget.setCountrycode(country);
      },
      child: Card(
        margin: EdgeInsets.all(0.15),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              Text(country.flag),
              SizedBox(
                width: 15,
              ),
              Text(country.code),
              SizedBox(
                width: 20,
              ),
              Text(country.name)
            ],
          ),
        ),
      ),
    );
  }
}
