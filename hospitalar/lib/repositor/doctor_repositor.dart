import 'package:hospitalar/modells/doctor_model.dart';
class DoctorRepositor{
  static List<DoctorModel> table = [
    DoctorModel(
      id: 1,
      name: 'Olívio Dalmer',
      specialty: 'Ophthalmologist',
      title: 'Dr. ',
      number: 1222,
      image: 'images/doc.jpg'
    ),
    DoctorModel(
      id: 2,
      name: 'Silk Silkadas',
      specialty: 'Dentist',
      title: 'Esp. ',
      number: 1222,
      image: 'images/doc.jpg'
    ),
      DoctorModel(
        id: 3,
        name: 'Noél Dalmer',
        specialty: 'Pediatrician',
          title: 'Enf. ',
        number: 1222,
        image: 'images/doc.jpg'
      ),
      DoctorModel(
        id: 4,
        name: 'Silvano Silkadas',
        specialty: 'Ophthalmologist',
        title: 'Dr. ',
        number: 1222,
        image: 'images/doc.jpg'
      ),
      DoctorModel(
        id: 5,
        name: 'Gaspar Dalmer',
        specialty: 'Dentist',
        title: 'Esp. ',
        number: 1222,
        image: 'images/doc.jpg'
      ),
      DoctorModel(
        id: 6,
        name: 'Quissama Silkadas',
        specialty: 'Pediatrician',
        title: 'Enf. ',
        number: 1222,
        image: 'images/doc.jpg'
      ),
      DoctorModel(
        id: 7,
        name: 'André Dalmer',
        specialty: 'Ophthalmologist',
        title: 'Dr. ',
        number: 1222,
        image: 'images/doc.jpg'
      ),
      DoctorModel(
        id: 8,
        name: 'Manuel Silkadas',
        specialty: 'Dentist',
        title: 'Esp. ',
        number: 1222,
        image: 'images/doc.jpg'
      ),
  ];

  List<DoctorModel> get doctor => table;

  DoctorModel? searchDoctor(int id){
    return table.firstWhere((doctor) => doctor.id == id);
  }
  List<DoctorModel> searchDoctors(){
    return table;
  }
}