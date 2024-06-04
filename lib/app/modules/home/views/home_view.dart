import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF201658),
      appBar: AppBar(
        backgroundColor: Color(0xFF201658),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ), // Ganti dengan ikon yang Anda inginkan
          onPressed: controller.onProfileButtonPressed,
        ),
        title: Obx(() => Text(
              '${controller.greetingMessage.value}',
              style: TextStyle(fontSize: 24, color: Colors.white),
            )),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: controller.onLogoutButtonPressed,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 210,
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              'Iridology Diabetes Detection',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 120,
                            child: Text(
                              'Kenali risiko diabetes dengan menganalisis pola iris.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 160,
                    height: 163,
                    child: Image.asset('assets/images/illhome.png'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: ShapeDecoration(
                color: Color(0xFFF9E8C9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Features',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(16),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: SizedBox(
                            width: 115,
                            height: 86,
                            child: Image.asset('assets/images/testdiabet.png',
                                fit: BoxFit
                                    .cover), // Ensure you have the image in your assets folder
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Diabetes Prediction',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  'Tes risiko diabetes dengan teknologi machine learning dengan menganalisis pola iris Anda untuk memberikan perkiraan risiko terkena diabetes dini. Ambil foto mata Anda, jalankan tes dan dapatkan hasil-nya.',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                width: 179.50,
                                                height: 35,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF201658),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () => controller
                                                      .onKlasifikasiDiabetesButtonPressed(),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .transparent, // Remove default background color
                                                    shadowColor: Colors
                                                        .transparent, // Remove shadow
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 12),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Jalankan Test',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(16),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: SizedBox(
                            width: 115,
                            height: 86,
                            child: Image.asset('assets/images/illmedical.png',
                                fit: BoxFit
                                    .cover), // Ensure you have the image in your assets folder
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Medical Record',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  'Dengan rekam medis digital, akses hasil tes prediksi diabetesmu dan tanggal pemeriksaannya secara mudah.',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Container(
                                                width: 179.50,
                                                height: 35,
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFF201658),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                child: ElevatedButton(
                                                  onPressed: () => controller
                                                      .onRekamMedisButtonPressed(),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .transparent, // Remove default background color
                                                    shadowColor: Colors
                                                        .transparent, // Remove shadow
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 12),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Periksa Data Medis',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
