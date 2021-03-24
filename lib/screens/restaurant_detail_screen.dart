import 'package:flutter/material.dart';
import 'package:restaurant_search_v5/bloc/get_restaurant_detail_bloc.dart';
import 'package:restaurant_search_v5/model/restaurant_detail_model.dart';
import 'package:restaurant_search_v5/style/theme.dart' as Style;

class RestaurantDetailScreen extends StatefulWidget {
  // final RestaurantDetailModel restoDetail;

  // RestaurantDetailScreen({Key key, @required this.restoDetail})
  //     : super(key: key);
  final String id;

  RestaurantDetailScreen({Key key, @required this.id}) : super(key: key);

  @override
  _RestaurantDetailScreenState createState() =>
      _RestaurantDetailScreenState(id);
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  // final RestaurantDetailModel restoDetail;

  // _RestaurantDetailScreenState(this.restoDetail);

  final String id;

  _RestaurantDetailScreenState(this.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRestaurantDetailBloc..getDetailRestaurant(this.id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Style.Colors.mainColor,
    //   body: CustomScrollView(
    //     slivers: <Widget>[
    //       SliverAppBar(
    //         floating: true,
    //         flexibleSpace: Placeholder(),
    //         expandedHeight: 200,
    //       ),
    //     ],
    //   ),
    // );

    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: Container(
        child: Center(
          child: Text(this.id),
        ),
      ),
    );
  }
}
