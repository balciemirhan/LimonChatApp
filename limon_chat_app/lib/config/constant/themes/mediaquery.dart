import 'package:flutter/material.dart';

class AppScreenSize {
/*
AppScreenSize sınıfı artık boxSize'yi constructor aracılığıyla alır ve bu sayede bu sınıfı 
başka bir sayfadan kullanabilirsiniz */

//  Dart sınıfının yapıcı metodudur. (context)
/* Nesne oluşturma sırasında yalnızca önceden hesaplanmış bir değere ihtiyacınız varsa 
bu yaklaşım bir sonraki yaklaşıma göre daha basit ve kısa olabilir. */

// : => Bu etiket, `AppScreenSize` sınıfının yapıcı metodunda `boxSize` alanını başlatmak için kullanılır.

/*   final double boxSize; (Yalnızca başlatıldığında değer alabilir. Sonradan değiştirilemez.)

  AppScreenSize(BuildContext context)
      : boxSize = MediaQuery.of(context).size.height / 7;

 */

// ---------------------------- ya da ----------------------------

// get boxScreen'e erişebilirliği temsil ediyor.
// get boxScreen'e erişebilirliği temsil ediyor.
// `get` anahtar sözcüğü ile tanımlanan bir *getter* metodu her çağrıldığında farklı bir değer döndürebilir.

/* final BuildContext context;

  AppScreenSize(this.context);
  get boxScreen {
    return MediaQuery.of(context).size.height / 7;
  } */

  // Genel olarak, `boxScreen` metodu dinamik olarak hesaplanan bir değeri döndürürken, `boxSize` alanı başlatıldığında değer alan ve daha sonra değiştirilemeyen bir alandır.

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static screenAwareSize(int size, BuildContext context) {
    double baseHeight = 640;
    return size * MediaQuery.of(context).size.width / baseHeight;
  }
}
