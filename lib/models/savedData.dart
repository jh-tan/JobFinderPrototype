import 'company.dart';
import 'course.dart';

class UserData{
  List<String> skillList = [];
  List<Company> jobApplied = [];
  List<Course> courseApplied = [];

  UserData();

  void saveSkill(String skill){
    skillList.add(skill);
  }

  void removeSkill(String skill){
    skillList.remove(skill);
  }

  List<String> getSkill(){
    return skillList;
  }

  void applyJob(Company company){
    jobApplied.add(company);
  }

  List<Company> getAppliedJob(){
    return jobApplied;
  }

  void subscribeCourse(Course course){
    courseApplied.add(course);
  }

  List<Course> getSubscribeCourse(){
    return courseApplied;
  }
}