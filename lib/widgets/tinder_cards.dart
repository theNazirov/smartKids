import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:palette_generator/palette_generator.dart';

class SwipeExample extends StatefulWidget {
  const SwipeExample({super.key});

  @override
  State<SwipeExample> createState() => _SwipeExampleState();
}

class _SwipeExampleState extends State<SwipeExample> {

  int currentindex=0;

  List images=[
    'assets/images/c1.png','assets/images/c2.png','assets/images/c3.png','assets/images/c4.png',
    'assets/images/c5.png','assets/images/c6.png','assets/images/c7.png','assets/images/c8.png',
  ];

  PaletteGenerator? paletteGenerator;

  Color defaultcolor=Colors.white;

  @override
  void initState() {
    super.initState();
    getColor();
  }

  getColor()async{
    paletteGenerator =await PaletteGenerator.fromImageProvider(AssetImage(images[currentindex]));

    if(paletteGenerator!.mutedColor!=null){
      defaultcolor=paletteGenerator!.mutedColor!.color;
    }
    else if(paletteGenerator!.vibrantColor!=null){
      defaultcolor=paletteGenerator!.vibrantColor!.color;
    }
    else if(paletteGenerator!.dominantColor!=null){
      defaultcolor=paletteGenerator!.dominantColor!.color;
    }
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: defaultcolor,centerTitle: true,title: const Text('Lavhalar',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),),
      backgroundColor:defaultcolor,

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 650,
        child: CardSwiper(

          cardsCount: 8,

          cardBuilder: (context,index,x,y){
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(images[index],fit: BoxFit.cover,),
            );
          },


          // allowedSwipeDirection: AllowedSwipeDirection.only(right: true),

          // numberOfCardsDisplayed: 4,

          // isLoop: false,

          // backCardOffset: Offset(50,50),

          onSwipe: (prevoius,current,direction){

            currentindex=current!;
            getColor();
            if(direction==CardSwiperDirection.right){
              Fluttertoast.showToast(msg: '🔥',backgroundColor: Colors.white,fontSize: 28);
            }
            else if (direction==CardSwiperDirection.left){
              Fluttertoast.showToast(msg: '😖',backgroundColor: Colors.white,fontSize: 28);
            }
            return true;

          },

        ),
      ),
    );
  }
}