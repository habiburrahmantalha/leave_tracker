enum LoadingStatus {
  initial,
  loading,
  success,
  failed;

  bool get isLoading => this == LoadingStatus.loading;

  bool get isSuccess => this == LoadingStatus.success;

  bool get isFailed => this == LoadingStatus.failed;
}

enum ToastType{
  regular("regular"),
  warning("warning"),
  error("error"),
  success("success");

  const ToastType(this.value);
  final String value;
}

enum AbsenceType {
  vacation(title: "Vacation", value: "vacation"),
  sickness(title: "Sickness", value: "sickness");
  const AbsenceType({required this.value, required this.title});
  final String value;
  final String title;
}

enum AbsenceStatus {
  pending(title: "Pending", value: "pending"),
  confirmed(title: "Confirmed", value: "confirmed"),
  rejected(title: "Rejected", value: "rejected");
  const AbsenceStatus({required this.value, required this.title});
  final String value;
  final String title;
}