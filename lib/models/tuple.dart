

class Tuple<S, T> {

  final S _first;
  final T _second;

  Tuple(this._first, this._second);

  S get first => _first;

  T get second => _second;

}