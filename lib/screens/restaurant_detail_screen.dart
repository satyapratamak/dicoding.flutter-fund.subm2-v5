import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurant_search_v5/bloc/get_restaurant_detail_bloc.dart';
import 'package:restaurant_search_v5/elements/error_element.dart';
import 'package:restaurant_search_v5/elements/loader_element.dart';
import 'package:restaurant_search_v5/model/restaurant_detail_model.dart';
import 'package:restaurant_search_v5/model/restaurant_detail_response.dart';
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

    return StreamBuilder<RestaurantDetailResponse>(
      stream: getRestaurantDetailBloc.subject.stream,
      builder: (context, AsyncSnapshot<RestaurantDetailResponse> snapshot) {
        if (snapshot.hasData) {
          // if (snapshot.data.error == null && snapshot.data.error.length > 0) {
          //   return buildErrorWidget("Please check your internet connection");
          // } else {
          //   return _buildListRestaurant(snapshot.data);
          // }
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget("Please check your internet connection");
          }
          return _buildRestaurantDetail(snapshot.data);
        } else if (snapshot.hasError) {
          //return buildErrorWidget(snapshot.error);
          return buildErrorWidget("Data mengalami kerusakan");
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildRestaurantDetail(RestaurantDetailResponse data) {
    RestaurantDetailModel restoDetail = data.restoDetail;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: <Widget>[
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: restoDetail.thumbnail == null
                            ? AssetImage("aseets/img/placeholder.jpg")
                            : NetworkImage(restoDetail.thumbnail),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.9),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      restoDetail.name,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Container(
                    //   height: 50,
                    //   width: width,
                    //   child: ListView.builder(
                    //     itemCount: int.parse(restoDetail.rating),
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, int key) {
                    //       return Icon(
                    //         Icons.star,
                    //         color: Colors.yellow[900],
                    //         size: 34,
                    //       );
                    //     },
                    //   ),
                    // ),
                    // RatingBar(
                    //   itemSize: 34,
                    //   initialRating: double.parse(restoDetail.rating) / 2,
                    //   minRating: 1,
                    //   direction: Axis.horizontal,
                    //   allowHalfRating: true,
                    //   itemCount: 5,
                    //   onRatingUpdate: (rating) {
                    //     print(rating);
                    //   },
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      restoDetail.description,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0.5,
                          wordSpacing: 1.5),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "City",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              restoDetail.city,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.orange[800],
                          padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                          child: Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 30,
                top: height * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
              // Positioned(
              //   right: 30,
              //   top: height * 0.45,
              //   child: GestureDetector(
              //     onTap: () {
              //       setState(() {
              //         _like = !_like;
              //       });
              //     },
              //     child: Container(
              //       height: 70,
              //       width: 70,
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(35),
              //           boxShadow: [
              //             BoxShadow(
              //                 color: Colors.black.withOpacity(0.5),
              //                 blurRadius: 5,
              //                 spreadRadius: 1)
              //           ]),
              //       child: Icon(
              //         Icons.favorite,
              //         size: 45,
              //         color: (_like) ? Colors.red : Colors.grey[600],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
