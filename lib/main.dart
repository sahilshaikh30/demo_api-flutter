import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


void main() {
  runApp(MaterialApp(
    home: ApiScreen(),
  ));
}

class ApiScreen extends StatefulWidget {
  
  

  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List dogs = [];

  

  dynamic fetchData() async {
    Dio dio = Dio();

    final response = await dio.get('https://dog.ceo/api/breeds/image/random');
    
    setState(() {
      dogs.add(response.data);
    });
    print(response.data);
    
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: dogs.length,
        itemBuilder: (context, index) => 
        Image.network(dogs[index]['message'])
          
      
      
       ),

      )
    ;
  }
}