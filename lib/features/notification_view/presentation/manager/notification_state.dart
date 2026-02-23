class NotificationState {
  final bool adhan;
  final bool salawat;
  final bool randomAzkar;
  final bool morningEvening;
  final bool dailyWerd;

  const NotificationState({
    required this.adhan,
    required this.salawat,
    required this.randomAzkar,
    required this.morningEvening,
    required this.dailyWerd,
  });

  factory NotificationState.inital() {
    return const NotificationState(
      adhan: true,
      salawat: true,
      randomAzkar: true,
      morningEvening: true,
      dailyWerd: true,
    );
  }
  NotificationState copyWith({
    bool? adhan,
    bool? salawat,
    bool? randomAzkar,
    bool? morningEvening,
    bool? dailyWerd,
  }) {
    return NotificationState(
      adhan: adhan ?? this.adhan,
      salawat: salawat ?? this.salawat,
      randomAzkar: randomAzkar ?? this.randomAzkar,
      morningEvening: morningEvening ?? this.morningEvening,
      dailyWerd: dailyWerd ?? this.dailyWerd,
    );
  }
}
