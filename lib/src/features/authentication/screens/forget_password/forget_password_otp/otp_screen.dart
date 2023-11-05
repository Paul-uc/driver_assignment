
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_management_system/src/constants/text_strings.dart';
import 'package:user_management_system/src/features/authentication/controllers/otp_controller.dart';
import '../../../../../constants/sizes.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(TSizes.defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                tOtpTitle,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 80.0,
                ),
              ),
              Text(tOtpSubTitle.toUpperCase(), style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: 40.0,),
              Text("$tOtpMessage support@coding.com", textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20.0,),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code){
                  otp = code;
                  OTPController.instance.verifyOTP(otp);
                },
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  OTPController.instance.verifyOTP(otp);
                }, child: const Text(TTexts.next)),) ,
            ],
          ),
        ),
      ),
    );
  }
}
