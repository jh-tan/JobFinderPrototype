class Course {
  final String name;
  final String offerUniversity;
  final String type;
  final String level;
  final String image;
  final String price;

  Course(this.name, this.offerUniversity, this.type,this.level,this.price,this.image);
}
  
  List<Course> categories = courseData
    .map((item) => Course(item['name'], item['offerUniversity'],item['type'],
                          item['level'],item['price'],item['image'])).toList();

const courseData = [
  {"name":"Digital Marketing",
   "offerUniversity":"University of Illinois at Urbana-Champaign",
   "type":"Specialization",
   "level":"Beginner",
   "price":"RM300",
   "image":"assets/images/marketing1.jpg"},

   {"name":"Introduction to Marketing",
   "offerUniversity":"University to Pennysylvania",
   "type":"Course",
   "level":"Mixed",
   "price":"RM400",
   "image":"assets/images/marketing2.jpg"},

  {"name":"Facebook Social Media Marketing",
   "offerUniversity":"Facebook",
   "type":"Professional Certificate",
   "level":"Beginner",
   "price":"RM100",
   "image":"assets/images/marketing3.jpg"},

  {"name":"Marketing Strategy",
   "offerUniversity":"IE Business School",
   "type":"Specialization",
   "level":"Beginner",
   "price":"RM250",
   "image":"assets/images/marketing4.jpg"},

  {"name":"Brand Management: Aligning Business, Brand and Behavious",
   "offerUniversity":"London Business School",
   "type":"Course",
   "level":"Beginner",
   "price":"RM1200",
   "image":"assets/images/marketing5.jpg"},

  {"name":"The Strategy of Content Marketing",
   "offerUniversity":"University of California, Davis",
   "type":"Course",
   "level":"Intermediate",
   "price":"RM200",
   "image":"assets/images/marketing6.jpg"},

  {"name":"Social Media Marketing",
   "offerUniversity":"Northwestern University",
   "type":"Specialization",
   "level":"Beginner",
   "price":"RM400",
   "image":"assets/images/marketing7.jpg"},

  {"name":"E-Marketing",
   "offerUniversity":"University of California, Irvine",
   "type":"Specialization",
   "level":"Beginner",
   "price":"RM50",
   "image":"assets/images/marketing8.jpg"},

  {"name":"Marketing Analytics",
   "offerUniversity":"University of Virginia",
   "type":"Course",
   "level":"Beginner",
   "price":"Free",
   "image":"assets/images/marketing9.jpg"},

  {"name":"Teknologi Maklumat dan Keusahawan",
   "offerUniversity":"National University of Malaysia",
   "type":"Course",
   "level":"Beginner",
   "price":"Free",
   "image":"assets/images/marketing10.jpg"},

];