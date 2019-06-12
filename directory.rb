require 'pry'
@students = []

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, filename doesn't exist."
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list of students.csv"
  puts "9. Exit"
end

def show_students
  header
  print_student_list
  footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:hobby], student[:country],
      student[:height], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
  end
    file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, hobby, country, height, cohort = line.chomp.split(',')
    @students << {name: name, hobby: hobby, country: country,
      height: height, cohort: cohort}
  end
    file.close
end

def input_students
  cohorts = [ 'January', 'February', 'March', 'April', 'May', 'June', 'July',
            'August', 'September', 'October', 'November', 'December' ]
  @input_count = 0
  while @input_count == 0
    puts "Welcome to the Student Directory"
    puts "To finish, just hit return on name entry"
    @input_count += 1
    while @input_count > 0
      puts "Enter student name"
      name = STDIN.gets.chomp
      break if name.empty? == true
      loop do
      puts "Enter Cohort student is attending, if unknown leave blank"
      @cohort = STDIN.gets.chompcapitalize
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
      @hobby = STDIN.gets.chomp
      puts "Enter country of birth"
      @country = STDIN.gets.chomp
      puts 'Enter their height'
      @height = STDIN.gets.chomp
      @students << {name: name, hobby: @hobby, country: @country,
        height: @height, cohort: @cohort}
      @input_count += 1
    end
  end
  if @input_count == 2
    puts "Now we have #{@students.count} student"
  else
    puts "Now we have #{@students.count} students"
  end
  @students
end

def header
  puts "The students of the Villians Academy"
  puts "-------------"
end

def print_student_list
  @students.sort_by do |student|
    student[:cohort]
  end
  count = 0
  while count < 1
  @students.each.with_index(1) { |student, index|
    puts "#{index}.  #{student[:cohort].center(4)} Cohort
    #{student[:name].center(5)}
    #{student[:hobby].center(4)}
    #{student[:country].center(3)}
    #{student[:height].center(4)}" }
    count += 1
  end
end

def footer
  if @input_count == 2
  puts "Overall, we have #{@students.count} great student"
  else
  puts "Overall, we have #{@students.count} great students"
  end
end

try_load_students
interactive_menu
