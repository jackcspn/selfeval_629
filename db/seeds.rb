# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email 
#puts 'CREATED ADMIN PASSWORD: ' << user.password
#puts user.role
user = User.create
user.email="user@example.com"
user.password= "changeme"
user.password_confirmation="changeme"
user.admin!

puts user.email
puts user.password
puts user.role
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions = [{:qtype => 'Multiple Choice',
              :topic => 'general' ,
              :content => 'What color is the sky?',
              :option1 => 'red',
              :option2 => 'green',
              :option3 => 'blue',
              :option4 => 'yellow',
              :answer => 'option3',
              :explanation => 'It is always blue unless you pollute it.'},
             {:qtype => 'Multiple Choice',
              :topic => '606_course',
              :content => 'When is the exam?',
              :option1 => 'Monday',
              :option2 => 'Tuesday',
              :option3 => 'Wednesday',
              :option4 => 'Thursday',
              :answer => 'option4',
              :explanation => 'Class is only on tuesday or thursday and tuesday is a holiday'},
             {:qtype => 'Multiple Choice',
              :topic => '606_course' ,
              :content => 'Who is the professor?',
              :option1 => 'Walker',
              :option2 => 'Chen',
              :option3 => 'Obama',
              :option4 => 'Trump',
              :answer => 'option1',
              :explanation => 'All of us know it'},
             {:qtype => 'Multiple Choice',
              :topic => 'Math' ,
              :content => 'What is \(\frac{1+2^2}{5}\)?',
              :option1 => '5',
              :option2 => '1',
              :option3 => '\(\frac{1}{3}\)',
              :option4 => '0',
              :answer => 'option2',
              :explanation => 'A number divided by itself is 1.'},
            ]

questions.each do |question|
    Question.create!(question)
end
