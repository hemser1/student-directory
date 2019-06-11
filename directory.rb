# students moved into array

def input_students
  puts "Place enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  puts "Enter the students hobby"
  hobby = gets.chomp
  puts "Enter country of birth"
  country = gets.chomp
  puts 'Enter their height'
  height = gets.chomp
  while !name.empty? do
    students << {name: name, hobby: hobby, country: country,
      height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    puts "Enter next students name"
    name = gets.chomp
    puts "Enter the students hobby"
    hobby = gets.chomp
    puts "Enter country of birth"
    country = gets.chomp
    puts 'Enter their height'
    height = gets.chomp
  end
  students
end

def header
  puts "The students of the Villians Academy"
  puts "-------------"
end

def each_student(students)
  count = 0
  while count < 1
  students.each.with_index(1) { |student, index|
    puts "#{index}.
    #{student[:name].center(4)}
    #{student[:hobby].center(4)}
    #{student[:country].center(4)}
    #{student[:height].center(4)}
    (#{student[:cohort]} cohort)".center(4) }
    count += 1
  end
end

def footer(names)
  puts "Overall, we have #{names.count} great student(s)"
end

def run_method
students = input_students
header
each_student(students)
footer(students)
end

run_method
