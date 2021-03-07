import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/constant/boxdecor.dart';
import 'package:test_prj/constant/colors.dart';
import 'package:test_prj/constant/textstyles.dart';
import 'package:flutter/cupertino.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key key}) : super(key: key);

  static const routeName = '/screen_1';
  static TextData a = TextData();
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffB9B9B9),
          body: Center(
            child: Container(
              height: 600,
              width: 400,
              alignment: Alignment.center,
              child: MainCardForPageOne(a: a),
            ),
          ),
        ),
      );
}

class MainCardForPageOne extends StatelessWidget {
  const MainCardForPageOne({
    Key key,
    @required this.a,
  }) : super(key: key);

  final TextData a;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 350,
        child: Column(
          children: [
            Stack(children: [BackButton(), TitleOfCard()]),
            Container(
              padding: EdgeInsets.all(16),
              child: Container(
                child: Text(
                    'Lorem ipsum dolor sit amet rat booty, consectetur adipiscing elit. In aliquet, tellus ac lobortis'),
              ),
            ),
            TextReadField(a: a),
            ForShadowContainer(),
            Container(
              color: Colors.white,
              width: 400,
              height: 62,
              child: TestButton(),
            )
          ],
        ),
      ),
    );
  }
}

class TitleOfCard extends StatelessWidget {
  const TitleOfCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 22),
      alignment: Alignment.center,
      child: Text(
        'Title',
        style: ProjectTextStyle.headerOne,
      ),
    );
  }
}

class ForShadowContainer extends StatelessWidget {
  const ForShadowContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320, height: 1, decoration: ProjectBoxDecor.boxShadowInCard);
  }
}

class TextReadField extends StatelessWidget {
  const TextReadField({
    Key key,
    @required this.a,
  }) : super(key: key);

  final TextData a;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.maxFinite,
      color: Color(0xffE5E5E5),
      child: Container(
        padding: EdgeInsets.only(right: 2),
        child: Scrollbar(
          isAlwaysShown: true,
          child: Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
            // padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SingleChildScrollView(
              child: Text('${a.textData}'),
            ),
          ),
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
          icon: Icon(
            CupertinoIcons.multiply,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}

class TestButton extends StatelessWidget {
  const TestButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(
            color: Color(0xffDB00FF),
          ),
        ),
        onPressed: () {},
        padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
        color: Color(0xffDB00FF),
        textColor: Colors.white,
        child: Text("TEST BUTTON", style: TextStyle(fontSize: 15)),
      ),
    );
  }
}

class TextData {
  String textData =
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. In aliquet, tellus ac lobortis consequat, eros nisi porta erat, et rhoncus ante enim vel felis. Donec finibus ac neque in mollis. Mauris nec tellus metus. Phasellus aliquam pellentesque pretium. Sed eget commodo massa. Sed non bibendum arcu. Morbi dictum libero ac massa pharetra, ac suscipit ex gravida. In a dolor euismod, congue diam ac, pharetra nibh. Donec sed fermentum elit. Mauris nec nulla nulla. Pellentesque quis commodo diam, ac scelerisque nisi. Nulla aliquam diam lacus, a placerat nisl molestie sit amet. Donec commodo id nisi a aliquet. Nam in nisl at velit maximus malesuada nec sit amet nisi. Etiam vitae porttitor orci, ut varius odio. Maecenas sit amet pretium ex.

Praesent quis felis nulla. Duis eget ante eget urna pulvinar ultrices. In vitae bibendum purus, ac tristique nibh. Ut a turpis erat. Curabitur at orci sit amet turpis porttitor imperdiet. Duis lectus lacus, feugiat eget eros sit amet, vulputate elementum odio. Aenean molestie consectetur ligula non vehicula. Integer vel turpis eget elit vehicula commodo. Pellentesque cursus arcu eu hendrerit molestie. Maecenas felis sem, pretium a pharetra ut, commodo eget tortor. Fusce vulputate lacus nisl, mattis ornare ante venenatis non. Curabitur vehicula, nulla non molestie bibendum, enim nisi commodo neque, non ornare velit sapien et dolor. Nullam blandit luctus massa, eget ultrices mi ornare ut.

Vivamus vitae sapien enim. Curabitur non lacus eros. Aenean eget neque id nunc gravida scelerisque sit amet et augue. Vivamus vulputate leo ullamcorper lacus sagittis, ac semper leo lacinia. Pellentesque semper erat tortor, at fringilla enim eleifend eu. Integer commodo sem eu ex tempor tempus. Nunc maximus, felis non maximus ultricies, tellus lacus ullamcorper urna, ac pretium arcu mi at turpis. Pellentesque laoreet tincidunt lorem et convallis. Quisque quam nisi, sollicitudin non consequat non, placerat sit amet leo. Pellentesque id posuere diam. Sed eget nunc libero. Nullam sit amet tellus nec erat interdum commodo ac a elit.

Duis blandit, dui sit amet scelerisque placerat, sem eros venenatis nibh, id faucibus magna lorem nec felis. Sed luctus porttitor tristique. In et vulputate augue. Duis fringilla lacus non nunc tempor, ut commodo nulla cursus. Sed venenatis enim eu libero feugiat lobortis. Aenean gravida, mi vitae aliquet dictum, leo sem feugiat nisi, id tristique est turpis porta ligula. Praesent euismod fringilla ipsum, sit amet hendrerit libero pretium id.

Praesent nec libero ut nunc euismod gravida lacinia vitae metus. Duis vehicula erat ipsum, vitae interdum odio vulputate non. Proin id vehicula justo. Nullam convallis, lacus quis lobortis efficitur, neque ex elementum arcu, in euismod eros diam vitae neque. Donec sagittis feugiat magna, ut convallis neque hendrerit finibus. Praesent in tellus nisl. Donec in enim ornare, sollicitudin nulla vel, luctus tortor. Cras ante eros, pellentesque aliquet luctus non, viverra eu turpis. Donec eget venenatis ex, vitae mattis tellus. Proin porttitor, ante at tristique ullamcorper, ex urna accumsan sem, vehicula malesuada orci velit in tortor. Nullam nisi libero, rhoncus id sapien a, molestie dignissim magna. Proin semper in arcu ut sollicitudin. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.''';
}
