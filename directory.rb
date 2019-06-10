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

def header
  puts "The students of the Villians Academy"
  puts "-------------"
end

def each_student(students)
  students.select { |student| student[:name].length < 12 }
  .each.with_index(1) { |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def footer(names)
  puts "Overall, we have #{names.count} great students"
end

def run_method
students = input_students
header
each_student(students)
footer(students)
end

run_method
