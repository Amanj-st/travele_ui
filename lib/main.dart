import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> city = [
    {"post":"best place to travel","name": "dubai",   "image": "dubay.jpeg"},
    {"post":"nice city in world","name": "maldive",   "image": "maldive.jpeg"},
    {"post":"nice city in world","name": "turkey",    "image": "turkey.jpeg"},
    {"post":"nice city in world","name": "lubnan",    "image": "lubnan.jpeg"},
    {"post":"nice city in world","name": "newwork",   "image": "newwork.jpeg"},
    {"post":"nice city in world","name": "sweden" ,   "image": "sweden.jpeg"},
    {"post":"nice city in world","name": "kurdistan", "image": "kurdistan.jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        bottomNavigationBar:  
         Container(height: 50,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Icon(Icons.home,color:  Color.fromARGB(255, 32, 154, 253),),
          Icon(Icons.notification_add,color: Color.fromARGB(255, 32, 154, 253),),
          Icon(Icons.search,color:  Color.fromARGB(255, 32, 154, 253),),
          Icon(Icons.person,color: Color.fromARGB(255, 32, 154, 253),),
           ],
          ),
        ),


     backgroundColor: const Color.fromARGB(255, 221, 236, 248),
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 221, 236, 248),
        title:
       const ListTile(
      leading:  CircleAvatar(
        backgroundImage: AssetImage("assets/svg/person.jpeg",
           
              ),
      ),
      title: Text("Well Come",style: TextStyle(color: Colors.black),),
      subtitle: Text("Hi amanj",style: TextStyle(color: Colors.black)),
     ),
      actions: const [
       
        Icon(Icons.notification_add_outlined),
         SizedBox(width: 20,),
      ],
      ),
      body: ListView(
children:  [
 const Padding(
   padding: EdgeInsets.all(12.0),
   child: Text("Where do you want to go ?",style: TextStyle(color: Colors.black,
   fontWeight: FontWeight.bold),),
 ),
 Row( 
   children: [
     Container(
      height: 45,width: 350,decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search)
        ),
      ),
     ),
     const Icon(Icons.menu,color: Colors.blue,size: 35,)
   ],
 ),
 const SizedBox(height: 10,),
Container(
  padding: const EdgeInsets.all(5),
  height: 150,
child: 
ListView.separated(
  itemBuilder:(context,i){
return Column(
  children:[Container(
  width: 75, 
  height: 75, 
  child: CircleAvatar(
    backgroundImage: AssetImage("assets/city/${city[i]["image"]}",
        ),
  )),
    Text("${city[i]["name"]}"),
      ]
);
}
, separatorBuilder: (context,i){ 
  return const SizedBox(width: 10);
}, 
scrollDirection: Axis.horizontal,
itemCount: city.length)
  
),
Container(
  padding:const EdgeInsets.all(10),
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
  Text("Popular"),
  Text("view All",style:  TextStyle(color: Colors.blue),)
],),),

Container(height: 300,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context,i){
    return Container(
   margin: const EdgeInsets.symmetric(horizontal:15),
    height:290,
  width: 300,
          padding: const EdgeInsets.all(10),
          decoration:  BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                      ,borderRadius: BorderRadius.circular(35)
                    ),
                    height: 200,
                    width: 300,
                    child:
                     Card(color: Colors.amber,
                      shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(35.0), // Adjust the radius as needed
                    ),
                      child:ClipRRect(borderRadius:BorderRadius.circular(35)
                      ,
                      child:  Image.asset(
                            "assets/city/${city[i]["image"]}",
                            fit: BoxFit.cover,
                          )
                       ,)
                        ),
                      
                      ),
                      Positioned(
                        right: 50,top: 15,
                        child:Container(
                          
                          height: 25,width: 50,decoration: BoxDecoration(
                            color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(15),
                          
                        ),
                       child:   const Row(
                         children: [
                           Icon(Icons.star,color: Colors.amber,),
                           Text("4.9")
                         ],
                       ))),
              
                      
                       ]
                ),
                  ListTile(
    title: Text("${city[i]["post"]}",style: const TextStyle(fontWeight: FontWeight.bold),),
    subtitle: Row(children: [
  const Icon(Icons.location_on_outlined),
  Text("${city[i]["name"]}",style: const TextStyle(color: Colors.black54),)
    ],),
    trailing: const Icon(Icons.arrow_circle_right_sharp,color: Colors.blue,),
   )
            ],
          ),
  
   );
  }, separatorBuilder: (context,i){
    return const SizedBox(width: 1,);
  }, itemCount: city.length),
),
const SizedBox(height: 20,),
const Padding(
  padding: EdgeInsets.all(8.0),
  child: Text("New Destination"),
),
const SizedBox(height: 10,),
Container(
  margin: const EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(10)
  ),
  child: ListTile(
    leading: Image.asset("assets/city/${city[0]["image"]}"),
    title: Text("${city[1]["name"]}"),
    subtitle:Text("${city[1]["name"]}"), 
    trailing: const Icon(Icons.arrow_circle_right,color: Colors.amber,),
  ),
)
 
 ]),
 );}
}
