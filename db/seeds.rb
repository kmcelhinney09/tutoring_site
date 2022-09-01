puts "Seeding Data"
grade_level = ["k","1","2","3","4","5","6","7","8","freshman", "sophomore", "junior", "senior"]
puts "creating users"
10.times do
  fake_name = Faker::Name.name
  fake_email = Faker::Internet.email
  fake_school = Faker::University.name
  grade = grade_level.sample
  password = 'Abc123!'
  User.create!(full_name: fake_name, email: fake_email, school: fake_school, grade:grade, password:password )
end

puts "Creating TimeSlots"
10.times do
  TutoringTimeSlot.create!(created_by:rand(1..11), tutor_capacity: rand(1..4), tutee_capacity: (1..12), booked_status: false, location_id: rand(1..5), date_start_time: DateTime.new(2022,8,28,8,0,0), date_end_time: DateTime.new(2022,8,28,10,0,0))
end

puts "Creating Subjects"
10.times do
  Subject.create!(name:Faker::Educator.subject)
end

puts "Creating Tutored Subjects"
10.times do
  TutoredSubject.create!(tutor_id:rand(1..10), subject_id:rand(1..10))
end

puts "Creating Requested Subjects"
10.times do
  RequestedSubject.create!(tutee_id:rand(1..10), subject_id:rand(1..10))
end

puts "Creating Online Resources"
10.times do
OnlineResource.create!(
  title:Faker::Educator.course_name,
  url:Faker::Internet.url,
  owner_id:rand(1..10),
  subject_id:rand(1..10),
  tag:Faker::Company.profession 
)
end

puts "Creating Locations"
10.times do
  Location.create!(
    name:Faker::Educator.university, 
    building:Faker::Educator.campus + " Hall",
    capacity:rand(1..15),
    school_id:rand(1..10)
  )
end

puts "Creating Class Schedule"
20.times do
  ClassSchedule.create!(
  student_id:rand(1..10),
  class_period_id:rand(1..7),
  subject_id:rand(1..10),
  teacher_id:rand(1..10)
  )
end

puts "Creating Class Periods"
7.times do
  ClassPeriod.create!(
    start_time: DateTime.new(2022,8,28,8,0,0), 
    end_time: DateTime.new(2022,8,28,10,0,0)
  )
end

puts "Creating Location Schedules"
10.times do
  LocationSchedule.create!(
    location_id:rand(1..10),
    date_start_time: DateTime.new(2022,8,28,8,0,0), 
    date_end_time: DateTime.new(2022,8,28,10,0,0),

  )
end

puts "Creating Booked Times Slots"
20.times do
  BookedTimeSlot.create!(
    tutor_id:rand(1..10),
    tutee_id:rand(1..10)    
  )
end

puts "Finished Seeding"
