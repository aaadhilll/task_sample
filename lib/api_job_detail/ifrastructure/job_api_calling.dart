import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:infopark/api_job_detail/domain/job_deta_mode.dart';

class JobDetailApiCalling {
  Future<Either<String, JobDetailModel>> getDataJobDetails() async {
    var request = http.Request('GET',
        Uri.parse('http://sjf.proximys.in/api/jobs/details/jsjsj-job0435/'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();

      return Right(jobDetailModelFromJson(res));
    } else {
      print(response.reasonPhrase);
      return const Left('Something went wrong');
    }
  }
}
