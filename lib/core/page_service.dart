import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masiaf/model/shop_model.dart';

class PageService {
  bool isLoading = false; // track if products fetching
  bool hasMore = true; // flag for more products available or not
  int documentLimit = 10; // documents to be fetched per request
  // QuerySnapshot? querySnapshot;
  DocumentSnapshot? lastDocument;

// ده علشان هجيب كل الصور
  final CollectionReference _adsCollectionRef =
      FirebaseFirestore.instance.collection('swiperads');

  Future<List<QueryDocumentSnapshot>> getAdsImage() async {
    var value = await _adsCollectionRef.get();

    return value.docs;
  }

// ده بال pagination
  getMarketListWithP(List<ShopModel> markets, String nameOfShop) async {
    if (nameOfShop == 'فنادق' || nameOfShop == 'Hotels') {
      if (!hasMore) {
        return;
      }
      if (isLoading) {
        return;
      }
      isLoading = true;
      QuerySnapshot? querySnapshot;
      if (lastDocument == null) {
        querySnapshot = await FirebaseFirestore.instance
            .collection('pharmacy')
            .orderBy('shopName')
            .limit(documentLimit)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection('pharmacy')
            .orderBy('shopName')
            .startAfterDocument(lastDocument!)
            .limit(documentLimit)
            .get();
      }
      if (querySnapshot.docs.length < documentLimit) {
        hasMore = false;
      }
      lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
      // نحولها ل json
      markets.addAll(querySnapshot.docs
          .map((e) => ShopModel.fromJson(e.data() as Map<String, dynamic>)));

      isLoading = false;
    } else if (nameOfShop == 'شقق' || nameOfShop == 'Apartments') {
      if (!hasMore) {
        return;
      }
      if (isLoading) {
        return;
      }
      isLoading = true;
      QuerySnapshot? querySnapshot;
      if (lastDocument == null) {
        querySnapshot = await FirebaseFirestore.instance
            .collection('markets')
            .orderBy('shopName')
            .limit(documentLimit)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection('markets')
            .orderBy('shopName')
            .startAfterDocument(lastDocument!)
            .limit(documentLimit)
            .get();
      }
      if (querySnapshot.docs.length < documentLimit) {
        hasMore = false;
      }
      lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
      // نحولها ل json
      markets.addAll(querySnapshot.docs
          .map((e) => ShopModel.fromJson(e.data() as Map<String, dynamic>)));

      isLoading = false;
    }

// متنساش لما تضيف محل علي الفاير بيز تعمل كده
// 1- تشيل الكومنت
// 2- عند ال collection هتحط الاسم اللي انت حطيته علي الفاير بيز
    // else if (nameOfShop == 'عيادات') {
    //   if (!hasMore) {
    //     print('No More Products');
    //     return;
    //   }
    //   if (isLoading) {
    //     // print('No More Products');
    //     return;
    //   }
    //   isLoading = true;
    //   QuerySnapshot? querySnapshot;
    //   if (lastDocument == null) {
    //     print('No More Products');
    //     querySnapshot = await FirebaseFirestore.instance
    //         .collection('markets')
    //         .orderBy('shopName')
    //         .limit(documentLimit)
    //         .get();

    //     // print(querySnapshot.docs.length);
    //     // print(querySnapshot.docs.);
    //   } else {
    //     // print('No More Products');
    //     querySnapshot = await FirebaseFirestore.instance
    //         .collection('markets')
    //         .orderBy('shopName')
    //         .startAfterDocument(lastDocument!)
    //         .limit(documentLimit)
    //         .get();

    //     // print(1);
    //   }
    //   if (querySnapshot.docs.length < documentLimit) {
    //     hasMore = false;
    //   }
    //   lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    //   markets.addAll(querySnapshot.docs);
    //   print(markets.length);
    //   print(nameOfShop);
    //   isLoading = false;
    // }
  }
}

































// import 'package:cloud_firestore/cloud_firestore.dart';

// class PageService {
//   //علشان نجيب البيانات من الفاير بيز
//   //shop list ثم  home view model لو هتضيف انواع محلات مختلفه مثلا لو عاوز تعمل ليست لعيادات هتبدأ من هنا وتعدل بعدين في ال
//   final CollectionReference _pharmacyCollectionRef =
//       FirebaseFirestore.instance.collection('pharmacy');

//   final CollectionReference _marketsCollectionRef =
//       FirebaseFirestore.instance.collection('markets');

// // ده جديد
// //   Query _q = FirebaseFirestore.instance
// //       .collection('markets')
// //       .orderBy('name')
// //       .limit(10);

// // Future<List<QueryDocumentSnapshot>> getMarketListWithP() async {
// //     var value = await _q.get();

// //     return value.docs;
// //   }

//   final CollectionReference _adsCollectionRef =
//       FirebaseFirestore.instance.collection('swiperads');

//   Future<List<QueryDocumentSnapshot>> getPharmacyList() async {
//     var value = await _pharmacyCollectionRef.get();

//     return value.docs;
//   }

//   Future<List<QueryDocumentSnapshot>> getMarketList() async {
//     var value = await _marketsCollectionRef.get();

//     return value.docs;
//   }

//   Future<List<QueryDocumentSnapshot>> getAdsImage() async {
//     var value = await _adsCollectionRef.get();

//     return value.docs;
//   }
// }

// بعد ال p
