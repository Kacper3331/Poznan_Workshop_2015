puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'admin123')
puts "Start Create Teachers"
3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end
puts "Finish Create Teachers"

puts "Start Create Subjects"
teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end
puts "Finish Create Subjects"

puts "Start Create Students"
25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end
puts "Finish Create Students"

puts "Start Associate Students with Subjects"
students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end
puts "Finish Associate Students with Subjects"

puts "Start Create and Associate SubjectItemNotes with Subjects"
SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end
puts "Finish Create and Associate SubjectItemNotes with Subjects"

puts "Seeds: done"
