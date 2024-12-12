import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget{
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                return <Widget>[
                  SliverAppBar(
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                          onPressed: (){}
                      )
                    ],
                    backgroundColor: Colors.green,
                    title: Text(
                      'Awesome App',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  )
                ];
              },
              body: Container(
                child: Center(
                  child: Text("List Data"),
                ),
              ),
            )
        )
    );
  }

}