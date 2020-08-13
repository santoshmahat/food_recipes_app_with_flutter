import 'package:ecommerce_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static final routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;

  FilterScreen(this.filters, this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;

  var _isLactoseFree = false;

  var _isVegan = false;

  var _isVegetarian = false;

  @override
  initState() {
    print('${widget.filters}');
    _isGlutenFree = widget.filters["gluten"];
    _isLactoseFree = widget.filters["lactose"];
    _isVegan = widget.filters["vegan"];
    _isVegetarian = widget.filters["vegeterian"];
    super.initState();
  }

  Widget _buildSwitchListTile(title, subtitle, value, onChanged) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              var selectedFilters = {
                "gluten": _isGlutenFree,
                "lactose": _isLactoseFree,
                "vegan": _isVegan,
                "vegeterian": _isVegetarian
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection.",
                style: Theme.of(context).textTheme.title),
          ),
          SizedBox(height: 4),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile("Gluten Free",
                    "Only include gluten free meal", _isGlutenFree, (value) {
                  setState(() {
                    _isGlutenFree = value;
                  });
                }),
                _buildSwitchListTile("Lactose Free",
                    "Only include lactose free meal", _isLactoseFree, (value) {
                  setState(() {
                    _isLactoseFree = value;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan", "Only include vegan meal", _isVegan, (value) {
                  setState(() {
                    _isVegan = value;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "Only include vegetarian meal", _isVegetarian,
                    (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
