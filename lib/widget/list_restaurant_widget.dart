import 'package:flutter/material.dart';
import 'package:restaurant_search_v5/bloc/get_list_restaurants_bloc.dart';
import 'package:restaurant_search_v5/elements/error_element.dart';
import 'package:restaurant_search_v5/elements/loader_element.dart';
import 'package:restaurant_search_v5/model/restaurant_model.dart';
import 'package:restaurant_search_v5/model/restaurant_response.dart';
import 'package:restaurant_search_v5/style/theme.dart' as Style;

class ListRestaurantWidget extends StatefulWidget {
  @override
  _ListRestaurantWidgetState createState() => _ListRestaurantWidgetState();
}

class _ListRestaurantWidgetState extends State<ListRestaurantWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListRestaurantBloc..getListRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RestaurantResponse>(
      stream: getListRestaurantBloc.subject.stream,
      builder: (context, AsyncSnapshot<RestaurantResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return _buildListRestaurant(snapshot.data);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error);
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildListRestaurant(RestaurantResponse data) {
    List<RestaurantModel> restaurants = data.restaurants;

    if (restaurants.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Empty Result",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else
      return Container(
        height: restaurants.length / 2 * 210.0,
        padding: EdgeInsets.all(5.0),
        child: new GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: restaurants.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.85),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => NewsDetail(
                  //       article: restaurants[index],
                  //     ),
                  //   ),
                  // );
                },
                child: Container(
                  width: 220.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[100],
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          1.0,
                          1.0,
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0)),
                              image: DecorationImage(
                                  image: restaurants[index].thumbnail == null
                                      ? AssetImage("aseets/img/placeholder.jpg")
                                      : NetworkImage(
                                          restaurants[index].thumbnail),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                        child: Text(
                          restaurants[index].name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(height: 1.3, fontSize: 15.0),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            width: 180,
                            height: 1.0,
                            color: Colors.black12,
                          ),
                          Container(
                            width: 30,
                            height: 3.0,
                            color: Style.Colors.mainColor,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              restaurants[index].city,
                              style: TextStyle(
                                  color: Style.Colors.mainColor, fontSize: 9.0),
                            ),
                            Text(
                              restaurants[index].rating != null
                                  ? " ${restaurants[index].rating} / 5"
                                  : "0 / 5",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 9.0),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}
