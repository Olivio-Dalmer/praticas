import 'package:flutter/material.dart';
import 'package:hospitalar/modells/doctor_model.dart';
import 'package:hospitalar/repositor/doctor_repositor.dart';

import 'components/bottom_circle_title.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final doctor = 1;
  final List<DoctorModel> Doctors = DoctorRepositor().doctor;
  @override
  Widget build(BuildContext context) {
    final doctor1 = DoctorRepositor().searchDoctor(doctor);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey.withOpacity(.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.menu),
                const Spacer(),
                const Text('Home', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  height: 40,
                  width: 40,
                  child: Image.asset('images/doc.jpg', fit: BoxFit.cover,),
                )
              ],
            ),
            const SizedBox(height: 10,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Who are you looking for?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text('Hi, Carsegie Mandover', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 10,),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomCircleTitle(title: "All"),
                BottomCircleTitle(title: "Therapist"),
                BottomCircleTitle(title: "Endocripplogy"),
                BottomCircleTitle(title: "Gascrgente"),
              ],
            ),
            const SizedBox(height: 10,),
            const Row(
              children: [
                Text('Next Appointments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                Spacer(),
                Text('See All', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 10,),
            if (doctor1 != null)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    height: 50,
                    width: 50,
                    child: Image.asset('images/doc.jpg', fit: BoxFit.cover,),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctor1.specialty, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                      Text('${doctor1.title} ${doctor1.name}', style: const TextStyle(fontSize: 13, color: Colors.grey),),
                      const Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.date_range, color: Colors.cyanAccent,),
                              Text('01, July', style: TextStyle(fontSize: 12, color: Colors.grey),),
                            ],
                          ),
                          SizedBox(width: 15,),
                          Row(
                            children: [
                              Icon(Icons.access_time, color: Colors.cyanAccent),
                              Text('06:22pm - 07:30pm', style: TextStyle(fontSize: 12, color: Colors.grey),),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            const Text('Specialists', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            Container(
              child: Expanded(
                child: ListView.separated(
                  itemCount: Doctors.length,
                  itemBuilder: (context, index) {
                    final doct = Doctors[index];
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          height: 50,
                          width: 50,
                          child: Image.asset('images/doc.jpg', fit: BoxFit.cover,),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doct.specialty,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${doct.title} ${doct.name}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.navigate_next_outlined),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range, color: Colors.grey),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart, color: Colors.grey),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: Colors.grey),
              label: ''),
        ],
      ),
    );
  }
}
