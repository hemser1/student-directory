
# students moved into array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]
#print them
puts "The students of the Villians Academy"
puts "-------------"
students.each do |student|
  puts student
end
# print the total
puts "Overall, we have #{students.count} great students"
