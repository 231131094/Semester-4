import 'package:flutter/material.dart';

class Registpage extends StatefulWidget {
  const Registpage({super.key});
  @override
  State<Registpage> createState() => _RegistpageState();
}

class _RegistpageState extends State<Registpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey[800],
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded), mouseCursor: SystemMouseCursors.click,),
        
      ),
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5,20,20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpUINsyuFs8GIe-KXGjIuxgfYYghN_EPJ4hg&s",width: double.infinity,fit: BoxFit.cover,height: 250,),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),),
                    Text("Create an account and order easily.", style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    TextField(
                      keyboardType: TextInputType.name,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        hintText: "Username",
                        icon: Icon(Icons.supervised_user_circle_rounded),
                        iconColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        hintText: "Email",
                        icon: Icon(Icons.email),
                        iconColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextField(
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Icon(Icons.key),
                        iconColor: Colors.white
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        onPressed: (){},
                        child: Text("Register", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height:40),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Text(" Or continue with ", style: TextStyle(color: Colors.grey[500]),),
                        Expanded(child: Divider())
                      ],
                    ),
                    SizedBox(height:40,),
                    Row(
                      children: [
                        Expanded(
                            child: IconButton(onPressed: (){
                            }, icon: Icon(Icons.g_mobiledata_rounded),
                            style: IconButton.styleFrom(backgroundColor: Colors.amber)),
                          ),
                          SizedBox(width: 20,),
                        Expanded(
                          child: IconButton(onPressed: (){
                          }, icon: Icon(Icons.facebook_rounded), 
                          style: IconButton.styleFrom(backgroundColor: Colors.blue),),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Center(child: TextButton(onPressed: (){}, child: Text("Already Have An Account? Login", style: TextStyle(color: Colors.white),))),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }
}