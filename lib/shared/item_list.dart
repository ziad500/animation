import 'package:flutter/material.dart';
import 'package:animation/models/item.dart';
import 'package:animation/screens/details.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  final List<Widget> _itemTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addItems();
    });
  }

  void _addItems() {
    List<Item> items = [
      Item(
          subTitle: 'Marvel',
          price: '350',
          mainTitle: 'Avengers',
          img: 'avengers.jpg'),
      Item(
          subTitle: 'Marvel',
          price: '400',
          mainTitle: 'Black Panther',
          img: 'blackpanther.jpg'),
      Item(
          subTitle: 'Marvel',
          price: '750',
          mainTitle: 'Spider Man',
          img: 'download.jpg'),
      Item(
          subTitle: 'Marvel', price: '600', mainTitle: 'Thor', img: 'thor.jpg'),
    ];

    Future blankFuture = Future(() {});
    // ignore: avoid_function_literals_in_foreach_calls
    items.forEach((Item item) {
      blankFuture = blankFuture.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _itemTiles.add(_buildTile(item));
          _listKey.currentState!.insertItem(_itemTiles.length - 1);
        });
      });
    });
  }

  Widget _buildTile(Item item) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Details(item)));
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${item.mainTitle}',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[300])),
          Text(item.subTitle.toString(),
              style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Hero(
            tag: item.img.toString(),
            child: Image.asset(
              'images/${item.img}',
              height: 50.0,
              fit: BoxFit.cover,
            ),
          )),
      trailing: IconButton(
          onPressed: () {
            // add item in the begining of the list
            _itemTiles.insert(
                0,
                _buildTile(
                  Item(
                      subTitle: 'Marvel',
                      price: '600',
                      mainTitle: 'Thor',
                      img: 'thor.jpg'),
                ));
            _listKey.currentState!.insertItem(0);
          },
          icon: const Icon(Icons.add)) /* Text('\$${trip.price}') */,
    );
  }

  final Tween<Offset> _offset =
      Tween(begin: const Offset(1, 0), end: const Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _itemTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(_offset),
          child: _itemTiles[index],
        );
      },
    );
  }
}
