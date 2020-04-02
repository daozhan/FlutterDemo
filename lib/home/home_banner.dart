import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';


class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: SizedBox(
          height: 165,
          child: Swiper(
            circular: true,
            indicator: RectangleSwiperIndicator(
              itemWidth: 8,
              itemActiveColor: Colors.green
            ),
            children: <Widget>[
              Image.network(
                  'https://tse1-mm.cn.bing.net/th?id=OIP.fkM2Nuzxs2PrJpHsT8raQgHaE8&w=276&h=183&c=7&o=5&pid=1.7',
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
        ),
      ),
    );
  }
}
