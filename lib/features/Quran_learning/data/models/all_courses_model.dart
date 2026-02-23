
class AllCoursesModel {
  final String type;
  final String title;
  final double time;
  final double allSesionsCount;
  final double completeSesionsCount;
  late double Presentage = completeSesionsCount / allSesionsCount * 100;
  final bool isLocked;

  AllCoursesModel({
    required this.isLocked,
    required this.type,
    required this.title,
    required this.time,
    required this.allSesionsCount,
    required this.completeSesionsCount,
  });
}
