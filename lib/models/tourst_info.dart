import 'package:flutter/material.dart';

class TouristInfo {
  TextEditingController nameController;
  TextEditingController surNameController;
  TextEditingController dateOfBirthController;
  TextEditingController citizenshipController;
  TextEditingController passportNumberController;
  TextEditingController validPeriodPassportController;

  TouristInfo({
    String? name,
    String? surName,
    String? dateOfBirth,
    String? citizenship,
    String? passportNumber,
    String? validPeriodPassport,
  })  : nameController = TextEditingController(text: name),
        surNameController = TextEditingController(text: surName),
        dateOfBirthController = TextEditingController(text: dateOfBirth),
        citizenshipController = TextEditingController(text: citizenship),
        passportNumberController = TextEditingController(text: passportNumber),
        validPeriodPassportController = TextEditingController(text: validPeriodPassport);

  // Don't forget to dispose controllers
  void dispose() {
    nameController.dispose();
    surNameController.dispose();
    dateOfBirthController.dispose();
    citizenshipController.dispose();
    passportNumberController.dispose();
    validPeriodPassportController.dispose();
  }
}
