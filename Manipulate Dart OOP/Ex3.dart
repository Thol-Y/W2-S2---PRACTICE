class CustomDuration{
  final int _milliseconds;

  CustomDuration.fromHours(int hours): _milliseconds = hours * 3600000;
  CustomDuration.fromMinutes(int minutes): _milliseconds = minutes * 60000;
  CustomDuration.fromSeconds(int seconds): _milliseconds = seconds * 1000;
  CustomDuration.fromMilliseconds(int milliseconds): _milliseconds = milliseconds;

  int get milliseconds => _milliseconds ;

  //overload operator
  //overload ">"
  bool operator >(CustomDuration other) => _milliseconds > other._milliseconds;
  //overload "+"
  CustomDuration operator +(CustomDuration other) => CustomDuration.fromMilliseconds(_milliseconds + other._milliseconds);
  //overload "-"
  CustomDuration operator -(CustomDuration other) => CustomDuration.fromMilliseconds(_milliseconds - other._milliseconds);
  
  CustomDuration(this._milliseconds);

  @override
  String toString(){
    return 'Custom Duration: $_milliseconds milliseconds';
  }
}

void main(){
  var duration1 = CustomDuration.fromHours(2);
  var duration2 = CustomDuration.fromMinutes(30);
  var duration3 = CustomDuration.fromSeconds(120);
  var duration4 = CustomDuration.fromMilliseconds(2000);

  print(duration1);
  print(duration2);
  print(duration3);
  print(duration4);

  print(duration2 > duration1);
  print(duration1 > duration2);
  print(duration1 + duration2);
  print(duration1 - duration2);
}