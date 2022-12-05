import 'package:flutter/foundation.dart';

import '../../models/product.dart';

class ProductsManager with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Hamburger',
      description: 'Vị thịt bò thơm ngon!',
      price: 15.99,
      imageUrl:
          /* 'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg' */
          'https://cdn.pixabay.com/photo/2022/06/14/18/58/beef-burger-7262651_960_720.jpg',
      isFavorite: true,
    ),
    Product(
      id: 'p2',
      title: 'Fried Chicken',
      description: 'Ăn giòn tan',
      price: 20.99,
      imageUrl:
          /* 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg' */
          /* 'https://cdn.pixabay.com/photo/2018/04/21/12/03/food-3338309_960_720.jpg' */
          'https://images.ctfassets.net/crbk84xktnsl/628GNW8pkzuEPID5e9zQnK/7a0a5d2d1690138c7006becb2fe4d398/Original_Recipe_6.png?h=900',
    ),
    Product(
      id: 'p3',
      title: 'Pepsi',
      description: 'Sảng khoái cùng Pepsi',
      price: 19.99,
      imageUrl:
          /*'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg' */
          'https://thumbs.dreamstime.com/z/bangkok-thailand-july-cold-drink-pepsi-cup-desk-front-kfc-s-restaurant-bangkok-thailand-july-cold-drink-pepsi-cup-124388989.jpg',
    ),
    Product(
      id: 'p4',
      title: 'French fries',
      description: 'Ngon khó cưỡng lại!',
      price: 12.99,
      imageUrl:
          /* https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg' */
          /* 'https://cdn.pixabay.com/photo/2014/01/23/19/34/french-fries-250641_960_720.jpg' */
          'https://images.ctfassets.net/crbk84xktnsl/3y4wkpHsUcVX6J9YQRK4qS/b29d648e1e1694eb704ae7e88099028f/Modifier_Chips_lge.png?h=900',
      isFavorite: true,
    ),
  ];

  void addProduct(Product product) {
    _items.add(
      product.copyWith(
        id: 'p${DateTime.now().toIso8601String()}',
      ),
    );
    notifyListeners();
  }

  void updateProduct(Product product) {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void toggleFavoriteStatus(Product product) {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((item) => item.id == id);
    _items.removeAt(index);
    notifyListeners();
  }


  int get itemCount {
    return _items.length;
  }

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product? findById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }
}
