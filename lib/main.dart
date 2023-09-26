import 'package:customer_insurance_app/models/automative.dart';
import 'package:customer_insurance_app/models/home.dart';
import 'package:customer_insurance_app/models/user.dart';
import 'package:customer_insurance_app/screens/LifeInsurancePlanScreens/lifeInsurancePlansScreen.dart';
import 'package:customer_insurance_app/screens/accidentInsurancePlanScreens/accidentInsuranceFormScreen1.dart';
import 'package:customer_insurance_app/screens/accidentInsurancePlanScreens/accidentInsurancePlansScreen.dart';
import 'package:customer_insurance_app/screens/automativeInsurancePlanScreens/automativeInsuranceFormScreen1.dart';
import 'package:customer_insurance_app/screens/bottomNavigationBarScreens.dart';
import 'package:customer_insurance_app/screens/cartScreens/applyPromoScreen.dart';
import 'package:customer_insurance_app/screens/cartScreens/cartScreen1.dart';
import 'package:customer_insurance_app/screens/editProfileScreen.dart';
import 'package:customer_insurance_app/screens/illnessInsurancePlanScreens/illnessInsuranceFormScreen1.dart';
import 'package:customer_insurance_app/screens/languageSelectionScreen.dart';
import 'package:customer_insurance_app/screens/marineInsurancePlanScreens/marineInsuranceFormScreen1.dart';
import 'package:customer_insurance_app/screens/marineInsurancePlanScreens/marineInsuranceScreen2.dart';
import 'package:customer_insurance_app/screens/myClaimsScreen.dart';
import 'package:customer_insurance_app/screens/officeInsurancePlanScreens/officeInsuranceFormScreen1.dart';
import 'package:customer_insurance_app/screens/otpVerifyScreen.dart';
import 'package:customer_insurance_app/screens/petInsurancePlanScreens/petInsuranceFormScreen1.dart';
import 'package:customer_insurance_app/screens/registerScreen.dart';
import 'package:customer_insurance_app/screens/signUpScreens/conditions_screen.dart';
import 'package:customer_insurance_app/screens/signUpScreens/create_password_screen.dart';
import 'package:customer_insurance_app/screens/signUpScreens/finish_register_screen.dart';
import 'package:customer_insurance_app/screens/signUpScreens/signup_id_scanner_screen.dart';
import 'package:customer_insurance_app/screens/signUpScreens/signup_profile_screen.dart';
import 'package:customer_insurance_app/screens/signUpScreens/signup_register_screen.dart';
import 'package:customer_insurance_app/screens/travelInsurancePlanScreens.dart/travelInsuranceFormScreen1.dart';
import 'package:customer_insurance_app/screens/travelInsurancePlanScreens.dart/travelInsurancePlansScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/LifeInsurancePlanScreens/lifeInsuranceFormScreen1.dart';
import 'screens/LifeInsurancePlanScreens/lifeInsuranceFormScreen2.dart';
import 'screens/LifeInsurancePlanScreens/lifeInsuranceScreen1.dart';
import 'screens/LifeInsurancePlanScreens/lifeInsuranceScreen2.dart';
import 'screens/LifeInsurancePlanScreens/lifeInsuranceScreen2IfFamily.dart';
import 'screens/accidentInsurancePlanScreens/accidentInsuranceScreen1.dart';
import 'screens/accidentInsurancePlanScreens/accidentInsuranceScreen2.dart';
import 'screens/automativeInsurancePlanScreens/automativeInsurancePlansScreen.dart';
import 'screens/automativeInsurancePlanScreens/automativeInsuranceScreen1.dart';
import 'screens/automativeInsurancePlanScreens/automativeInsuranceScreen2.dart';
import 'screens/automativeInsurancePlanScreens/automativeInsuranceScreen3.dart';
import 'screens/homeInsurancePlanScreens/homeInsurancePlansScreen.dart';
import 'screens/homeInsurancePlanScreens/homeInsuranceScreen1.dart';
import 'screens/homeInsurancePlanScreens/homeInsuranceScreen2.dart';
import 'screens/homeInsurancePlanScreens/homeInsuranceScreen3.dart';
import 'screens/homeInsurancePlanScreens/homeInsuranceformScreen1.dart';
import 'screens/homeInsurancePlanScreens/homeInsuranceformScreen2.dart';
import 'screens/illnessInsurancePlanScreens/illnessInsurancePlansScreen.dart';
import 'screens/illnessInsurancePlanScreens/illnessInsuranceScreen1.dart';
import 'screens/illnessInsurancePlanScreens/illnessInsuranceScreen2.dart';
import 'screens/illnessInsurancePlanScreens/illnessInsuranceScreen3.dart';
import 'screens/marineInsurancePlanScreens/marineInsurancePlansScreen.dart';
import 'screens/marineInsurancePlanScreens/marineInsuranceScreen1.dart';
import 'screens/marineInsurancePlanScreens/marineInsuranceScreen3.dart';
import 'screens/medicalInsurancePlanScreens/medicalInsuranceFormScreen1.dart';
import 'screens/medicalInsurancePlanScreens/medicalInsuranceFormScreen2.dart';
import 'screens/medicalInsurancePlanScreens/medicalInsurancePlansScreen.dart';
import 'screens/medicalInsurancePlanScreens/medicalInsuranceScreen1.dart';
import 'screens/medicalInsurancePlanScreens/medicalInsuranceScreen2IfFamily.dart';
import 'screens/medicalInsurancePlanScreens/medicalInsuranceScreen3.dart';
import 'screens/medicalInsurancePlanScreens/medicalInsuranceScreen4.dart';
import 'screens/myPoliciesScreen.dart';
import 'screens/officeInsurancePlanScreens/officeInsurancePlansScreen.dart';
import 'screens/officeInsurancePlanScreens/officeInsuranceScreen1.dart';
import 'screens/officeInsurancePlanScreens/officeInsuranceScreen2.dart';
import 'screens/officeInsurancePlanScreens/officeInsuranceScreen3.dart';
import 'screens/petInsurancePlanScreens/petInsurancePlansScreen.dart';
import 'screens/petInsurancePlanScreens/petInsuranceScreen1.dart';
import 'screens/petInsurancePlanScreens/petInsuranceScreen2.dart';
import 'screens/splashScreen.dart';
import 'screens/travelInsurancePlanScreens.dart/travelInsuranceScreen1.dart';
import 'screens/travelInsurancePlanScreens.dart/travelInsuranceScreen2.dart';
import 'screens/travelInsurancePlanScreens.dart/travelInsuranceScreen3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setBool('showTour', true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = "";

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userToken') != null) {
      token = await prefs.getString('userToken')!;
      print(token);
    }
  }

  @override
  void initState() {
    getToken();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Insurance App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme)),
      home: token.isNotEmpty ? BottomNavigationBarScreens() : CartScreen1(),
      // initialRoute: LanguageSelectionScreen.languageSelectionScreen,
      routes: {
        BottomNavigationBarScreens.bottomNavScreens: (context) =>
            const BottomNavigationBarScreens(),
        HomeInsuranceScreen1.homeInsuranceRoute: (context) =>
            const HomeInsuranceScreen1(),

        HomeInsurancePlansScreen.HomePlansScreen: (context) =>
            const HomeInsurancePlansScreen(),
        HomeInsuranceFormScreen1.HomeForm1: (context) =>
            const HomeInsuranceFormScreen1(),
        HomeInsuranceFormScreen2.HomeForm2: (context) =>
            const HomeInsuranceFormScreen2(),
        MyClaimsScreen.myClaimsScreen: (contex) => MyClaimsScreen(),
        MyPoliciesScreen.myPoliciesRoute: (context) => const MyPoliciesScreen(),
        MedicalInsuranceScreen1.medialInsuranceScreen1: (context) =>
            const MedicalInsuranceScreen1(),

        MedicalInsurancePlansScreen.MedicalPlansScreen: (contexy) =>
            const MedicalInsurancePlansScreen(),
        MedicalInsuranceFormScreen1.MedicalForm1: (context) =>
            const MedicalInsuranceFormScreen1(),
        MedicalInsuranceFormScreen2.MedicalForm2: (context) =>
            const MedicalInsuranceFormScreen2(),
        AccidentScreen1.accidentInsurancePlan: (context) =>
            const AccidentScreen1(),
        // AccidentScreen2.accidentScreen2: (context) =>  AccidentScreen2(),
        AccidentInsurancePlansScreen.AccidentPlansScreen: (context) =>
            const AccidentInsurancePlansScreen(),
        LifeInsuranceScreen1.lifeInsurancePlan: (context) =>
            const LifeInsuranceScreen1(),
        LifeInsuranceScreen2.LifeScreen2: (context) =>
            const LifeInsuranceScreen2(),
        LifeInsuranceScreen2IfFamily.LifeScreen2IfFamily: (context) =>
            const LifeInsuranceScreen2IfFamily(),
        LifeInsurancePlansScreen.LifePlansScreen: (context) =>
            const LifeInsurancePlansScreen(),
        LifeInsuranceformScreen1.lifeForm1: (context) =>
            const LifeInsuranceformScreen1(),
        LifeInsuranceFormScreen2.LifeForm2: (context) =>
            const LifeInsuranceFormScreen2(),
        TravelInsuranceScreen1.travelInsurance: (context) =>
            const TravelInsuranceScreen1(),
        TravelInsuranceScreen2.TravelScreen2: (context) =>
            const TravelInsuranceScreen2(),
        TravelInsuranceScreen3.TravelScreen3: (context) =>
            const TravelInsuranceScreen3(),
        TravelInsurancePlansScreen.travelPlansScreen: (context) =>
            const TravelInsurancePlansScreen(),
        MarineInsuranceScreen1.marineScreen1: (context) =>
            const MarineInsuranceScreen1(),

        MarineInsurancePlansScreen.marinePlansScreen: (context) =>
            const MarineInsurancePlansScreen(),
        PetInsuranceScreen1.petScreen1: (context) =>
            const PetInsuranceScreen1(),

        PetInsurancePlansScreen.petPlansScreen: (context) =>
            const PetInsurancePlansScreen(),
        IllnessInsuranceScreen1.illnessScreen1: (context) =>
            const IllnessInsuranceScreen1(),
        IllnessInsuranceScreen2.illnessScreen2: (context) =>
            const IllnessInsuranceScreen2(),
        IllnessInsuranceScreen3.illnessScreen3: (context) =>
            const IllnessInsuranceScreen3(),
        IllnessInsurancePlansScreen.illnessPlansScreen: (context) =>
            const IllnessInsurancePlansScreen(),
        AutomativeInsuranceScreen1.automativeScreen1: (context) =>
            const AutomativeInsuranceScreen1(),

        AutomativeInsurancePlansScreen.automativePlansScreen: (context) =>
            const AutomativeInsurancePlansScreen(),
        OfficeInsuranceScreen1.officeScreen1: (context) =>
            const OfficeInsuranceScreen1(),
        OfficeInsuranceScreen2.officeScreen2: (context) =>
            const OfficeInsuranceScreen2(),
        OfficeInsuranceScreen3.officeScreen3: (context) =>
            const OfficeInsuranceScreen3(),
        OfficeInsurancePlansScreen.officePlansScreen: (context) =>
            const OfficeInsurancePlansScreen(),
        // ConditionsScreen.conditionsScreen: (context) =>
        //      ConditionsScreen(),
        // CreatePasswordScreen.createPasswordScreen: (context) =>
        //      CreatePasswordScreen(),
      },
    );
  }
}
