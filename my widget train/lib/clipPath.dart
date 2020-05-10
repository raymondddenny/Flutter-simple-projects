import 'package:flutter/material.dart';

class CClipPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Clip Path'),
      ),
      body: Center(
        child: ClipPath(
          clipper: MyClipper(),
          child: Image(
              width: 400,
              image: NetworkImage(
                  "http://www.diegomallien.com/wp-content/uploads/2017/03/Meaning-of-travelling.jpg?x38602")),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // tentukan panjang linenyanya
    // lineTo = garis lurus
    path.lineTo(0, size.height);
    // quadraticBezierto = garis lengkung
    // x1 y1 = jarak ke puncak
    // x2 y2 = jarak dari punjak ke ujung garis (sesuai ukuran gambar)
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.75, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
