class Errors {
  Errors._();
  static String map(ErrorEnum code) {
    switch (code) {
      case ErrorEnum.noInternet:
        return 'khong co mang';

      case ErrorEnum.unKnow:
      default:
        return 'Khong biet loi gi';
    }
  }
}

enum ErrorEnum {
  noInternet,
  unKnow,
}
