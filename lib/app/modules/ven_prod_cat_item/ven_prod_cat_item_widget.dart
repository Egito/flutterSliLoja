import 'package:flutter/material.dart';

class VenProdCatItemWidget extends StatelessWidget {
  final String wDescr;
  final String wCateg;
  final String wImagem;
  final String wPreco;

  const VenProdCatItemWidget({
    Key key,
    @required this.wDescr,
    @required this.wCateg,
    @required this.wImagem,
    @required this.wPreco,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Positioned(
            top: 50,
            right: -50,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.5),
              radius: 130,
            ),
          ),
          Positioned(
            top: 100,
            right: 50,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.2),
              radius: 130,
            ),
          ),
          Positioned(
            top: 120,
            right: 150,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(.1),
              radius: 130,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wDescr,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(height: 10),
                Text(wCateg,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        width: 150,
                        child: Image.network(
                          wImagem,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        )),
                    Expanded(
                      child: Text(wPreco,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
