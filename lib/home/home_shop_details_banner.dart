import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';


class HomeShopDetailsBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 188,
      child: Swiper(
        circular: true,
        indicator: CircleSwiperIndicator(
            itemActiveColor: Colors.yellow
        ),
        children: <Widget>[
          Image.network(
              'https://desk-fd.zol-img.com.cn/t_s144x90c5/g2/M00/0E/0B/ChMlWl0AymGIORKfAAFAD6suUQoAAK0bgI-CokAAUAn394.jpg',
              fit: BoxFit.fill
          ),
          Image.network(
              'https://desk-fd.zol-img.com.cn/t_s144x90c5/g2/M00/0E/0B/ChMlWV0AylqIJt8xAAFpz6rtx5kAAK0bgGmkD8AAWnn608.jpg',
              fit: BoxFit.fill
          ),
          Image.network(
              'https://desk-fd.zol-img.com.cn/t_s144x90c5/g2/M00/0E/0B/ChMlWl0AymKIUUhcAAJO6du_C-oAAK0bgJF-OQAAk8B732.jpg',
              fit: BoxFit.fill
          ),
          Image.network(
              'https://desk-fd.zol-img.com.cn/t_s144x90c5/g2/M00/0E/0B/ChMlWl0AymGIORKfAAFAD6suUQoAAK0bgI-CokAAUAn394.jpg',
              fit: BoxFit.fill
          ),
          Image.network(
              'https://desk-fd.zol-img.com.cn/t_s144x90c5/g2/M00/0E/0B/ChMlWV0Ayl6IIf8bAAKupqPR6wYAAK0bgIExf8AAq6-838.jpg',
              fit: BoxFit.fill
          ),
        ],
      ),
    );
  }
}
