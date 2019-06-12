def input_students
  students = []
  cohorts = [ 'January', 'February', 'March', 'April', 'May', 'June', 'July',
            'August', 'September', 'October', 'November', 'December' ]
  @input_count = 0
  while @input_count == 0
    puts "Welcome to the Student Directory"
    puts "To finish, just hit return on name entry"
    @input_count += 1
    while @input_count > 0
      puts "Enter student name"
      name = gets.chomp
      break if name.empty? == true
      loop do
      puts "Enter Cohort student is attending, if unknown leave blank"
      @cohort = gets.chomp.capitalize
        if @cohort.empty? == true
          @cohort = 'November'
          break
        elsif cohorts.include? @cohort
          break if true
        else
          puts "Unknown Cohort, please enter actual month"
        end
      end
      puts "Enter the students hobby"
      hobby = gets.chomp
      puts "Enter country of birth"
      country = gets.chomp
      puts 'Enter their height'
      height = gets.chomp
      students << {name: name, hobby: hobby, country: country,
        height: height, cohort: @cohort}
      @input_count += 1
    end
  end
  if @input_count == 2
    puts "Now we have #{students.count} student"
  else
    puts "Now we have #{students.count} students"
  end
  students
end

def header
  puts "The students of the Villians Academy"
  puts "-------------"
end

def each_student(students)
  students.sort_by do |student|
    student[:cohort]
  end
  count = 0
  while count < 1
  students.each.with_index(1) { |student, index|
    puts "#{index}.  #{student[:cohort].center(4)} cohort
    #{student[:name].center(5)}
    #{student[:hobby].center(4)}
    #{student[:country].center(3)}
    #{student[:height].center(4)}" }
    count += 1
  end
end

def footer(names)
  if @input_count == 2
  puts "Overall, we have #{names.count} great student"
  else
  puts "Overall, we have #{names.count} great students"
  end
end

def run_method
students = input_students
header
each_student(students)
footer(students)
end

run_method
