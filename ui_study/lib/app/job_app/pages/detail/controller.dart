import 'package:get/get.dart';
import 'package:ui_study/app/job_app/model/model.dart';

class JobDetailController extends GetxController {
  final List<String> tags = Job.generateJobTags();
  final List<Job> jobs = Job.generateJobs();
}
