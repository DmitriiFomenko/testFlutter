import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ButtunsState {
  List<int> value = [0, 0, 0, 0];

  ButtunsState(this.value);

  ButtunsState push() => ButtunsState(this.value);
}

class ButtonsCubit extends Cubit<ButtunsState> {
  /// {@macro counter_cubit}
  ButtonsCubit() : super(ButtunsState([0, 0, 0, 0])) {
    getDoc();
  }

  QueryDocumentSnapshot<Object?>? doc = null;

  ButtunsState add(int index) {
    state.value[index]++;
    if (doc != null) {
      FirebaseFirestore.instance.collection('Dates').doc(doc!.id).set({
        'Date': dateNow(),
        'Button0': state.value[0],
        'Button1': state.value[1],
        'Button2': state.value[2],
        'Button3': state.value[3]
      });
    }
    return state.push();
  }

  void increment(int index) => emit(add(index));

  Future<void> getDoc() async {
    var dates = FirebaseFirestore.instance.collection('Dates');

    QuerySnapshot querySnapshot = await dates.get();

    var docs =
        querySnapshot.docs.where((element) => element.get('Date') == dateNow());
    if (docs.isNotEmpty) {
      doc = docs.first;
    } else {
      dates.add({
        'Date': dateNow(),
        'Button0': 0,
        'Button1': 0,
        'Button2': 0,
        'Button3': 0
      });
      querySnapshot = await dates.get();
      doc = querySnapshot.docs
          .firstWhere((element) => element.get('Date') == dateNow());
    }
    emit(ButtunsState([
      doc!.get('Button0'),
      doc!.get('Button1'),
      doc!.get('Button2'),
      doc!.get('Button3'),
    ]));
  }
}

String dateNow() =>
    '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
