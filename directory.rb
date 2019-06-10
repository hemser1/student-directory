# students moved into array

def input_students
  puts "Place enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def first_letter
  puts 'Enter the first letter of the name you want?'
  first_letter = gets.chomp
end

def header
  puts "The students of the Villians Academy"
  puts "-------------"
end

def each_student(students, first_letter)
  students.select { |student| student[:name].chars.first.downcase ==
    first_letter.downcase }
  .each.with_index(1) { |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def footer(names)
  puts "Overall, we have #{names.count} great students"
end

def run_method
students = input_students
header
each_student(students, first_letter)
footer(students)
end

run_method
