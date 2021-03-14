import 'package:doctorconsultationproject/contants/colors.dart';
import 'package:doctorconsultationproject/models/doctorCard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Now Available',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildDoctorList(),
            ],
          ),
        ),
      ),
    );
  }

  buildDoctorList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          DoctorCard(
            'Dr.  Patil',
            'Heart Surgeon - Dhole Hospital, Dhanori',
            'assets/images/docprofile/doc1.png',
            kBlueColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'Dr. Bhosale',
            'Dental Surgeon - Lotus Hospitals, Kharadi',
            'assets/images/docprofile/doc2.png',
            kYellowColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'Dr. Deshmukh',
            'Eye Specialist - EyeCare Hospitals, Viman nagar',
            'assets/images/docprofile/doc3.png',
            kOrangeColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'Dr. Rucha',
            'Physician Specialist - Sahyadri Hospitals, Kothrud',
            'assets/images/docprofile/doc1.png',
            kOrangeColor,
          ),
          SizedBox(
            height: 20,
          ),
          DoctorCard(
            'Dr. Prashant',
            'Neuro Specialist - WellCare Hospitals, Pune Station',
            'assets/images/docprofile/doc3.png',
            kOrangeColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

