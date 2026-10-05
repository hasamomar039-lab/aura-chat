import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main()=>runApp(AuraApp());
class AuraApp extends StatelessWidget{
@override Widget build(BuildContext context){
return MaterialApp(debugShowCheckedModeBanner:false,home:SplashScreen());}}
class SplashScreen extends StatefulWidget{
@override State<SplashScreen> createState()=>_SplashScreenState();}
class _SplashScreenState extends State<SplashScreen>{
@override void initState(){super.initState();Future.delayed(Duration(seconds:2),(){Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>ChatListScreen()));});}
@override Widget build(BuildContext context){
return Scaffold(backgroundColor:Color(0xFF0A0A12),body:Center(child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[Container(width:100,height:100,decoration:BoxDecoration(gradient:LinearGradient(colors:[Color(0xFF6C5CE7),Color(0xFFA29BFE)]),shape:BoxShape.circle),child:Icon(Icons.bolt,size:50,color:Colors.white)),SizedBox(height:20),Text('AURA',style:GoogleFonts.poppins(fontSize:40,fontWeight:FontWeight.bold,color:Colors.white))])));}}
class ChatListScreen extends StatelessWidget{
final chats=[{"name":"احمد یوسفزی","msg":"سلام!","time":"3:40"}];
@override Widget build(BuildContext context){
return Scaffold(backgroundColor:Color(0xFF0A0A12),appBar:AppBar(backgroundColor:Color(0xFF0A0A12),title:Text('AURA')),body:ListView.builder(itemCount:chats.length,itemBuilder:(c,i){return ListTile(onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>ChatScreen(name:chats[i]['name']!))),leading:CircleAvatar(backgroundColor:Color(0xFF6C5CE7),child:Text(chats[i]['name']![0])),title:Text(chats[i]['name']!,style:TextStyle(color:Colors.white)),subtitle:Text(chats[i]['msg']!,style:TextStyle(color:Colors.white54)));}),floatingActionButton:FloatingActionButton(backgroundColor:Color(0xFF6C5CE7),child:Icon(Icons.chat_bubble),onPressed:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>ChatScreen(name:"نوی چیټ")))),);}}
class ChatScreen extends StatefulWidget{final String name;ChatScreen({required this.name});@override State<ChatScreen> createState()=>_ChatScreenState();}
class _ChatScreenState extends State<ChatScreen>{
final controller=TextEditingController();
List messages=[{"text":"سلام!","isMe":false}];
void send(){if(controller.text.isEmpty)return;setState(()=>messages.add({"text":controller.text,"isMe":true}));controller.clear();}
@override Widget build(BuildContext context){
return Scaffold(backgroundColor:Color(0xFF0A0A12),appBar:AppBar(title:Text(widget.name)),body:Column(children:[Expanded(child:ListView.builder(itemCount:messages.length,itemBuilder:(c,i){var m=messages[i];return Align(alignment:m['isMe']?Alignment.centerRight:Alignment.centerLeft,child:Container(margin:EdgeInsets.all(8),padding:EdgeInsets.all(12),decoration:BoxDecoration(color:m['isMe']?Color(0xFF6C5CE7):Color(0xFF1E1E2E),borderRadius:BorderRadius.circular(12)),child:Text(m['text'],style:TextStyle(color:Colors.white))));})),Container(padding:EdgeInsets.all(8),child:Row(children:[Expanded(child:TextField(controller:controller,decoration:InputDecoration(hintText:"پیغام..."))),IconButton(icon:Icon(Icons.send),onPressed:send)]))]),);}}
