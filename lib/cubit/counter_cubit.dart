import 'package:bloc_counter_cubit/cubit/counter_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  int counter=0;
  CounterCubit() : super(CounterInitiate());

  void counterIncrease(){
    counter++;
    emit(CounterValueUpdate(counter: counter));
  }
  void counterDicrease(){
    counter--;
    emit(CounterValueUpdate(counter: counter));
  }
}
