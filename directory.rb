require "csv"
@students = []

def try_load_students
  check_file
  load_students
end

def filename
  ARGV.first || @load_as ||  "students.csv"
end

def check_file
  unless File.exists?(filename)
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def load_input
  puts "Enter file you want to load"
  @load_as = gets.chomp
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Enter file you want save to"
    @save_as = gets.chomp
    save_students
    puts "Success!"
  when "4"
    load_input
    load_students
    puts "Success!"
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_menu
  puts "1. Input students manually"
  puts "2. Show the Students Directory"
  puts "3. Save the Students Directory to file"
  puts "4. Load the CSV file of students"
  puts "9. Exit"
end

def show_students
  header
  print_student_list
  footer
end

def save_students
  CSV.open(@save_as, "w") do |file|
    @students.each do |student|
      file << [student[:name], student[:hobby], student[:country],
        student[:height], student[:cohort]]
    end
  end
end

def load_students
  CSV.foreach(filename) do |line|
    name, hobby, country, height, cohort = line
    shovel_to_array(name, hobby, country, height, cohort)
    puts "Loaded #{student_count} student#{plural?} from #{filename}"
  end
end

def input_students
  input_count = 0
  puts "Welcome to the Student Directory"
  puts "To finish, just hit return on name entry"
    loop do
      puts "Enter student name"
      name = STDIN.gets.chomp
      break if name.empty? == true
      cohort_check
      puts "Enter the students hobby"
      hobby = STDIN.gets.chomp
      puts "Enter country of birth"
      country = STDIN.gets.chomp
      puts 'Enter their height'
      height = STDIN.gets.chomp
      shovel_to_array(name, hobby, country, height, @cohort)
      input_count += 1
    end
  student_decider
  @students
end

def student_decider
    puts "Now we have #{student_count} student#{plural?}"
end

def student_count
  @students.count
end

def cohort_check
  cohorts = [ 'January', 'February', 'March', 'April', 'May', 'June', 'July',
            'August', 'September', 'October', 'November', 'December' ]
  loop do
  puts "Enter Cohort student is attending, if unknown leave blank"
  @cohort = STDIN.gets.chomp.capitalize
    if @cohort.empty? == true
      @cohort = 'November'
      break
    elsif cohorts.include? @cohort
      break if true
    else
      puts "Unknown Cohort, please enter actual month"
    end
  end
end

def shovel_to_array(name, hobby, country, height, cohort)
  @students << {name: name, hobby: hobby, country: country,
    height: height, cohort: cohort}
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
  puts "Overall, we have #{student_count} great student#{plural?}"
end

def plural?
  return 's' if many_students?
end

def many_students?
  student_count > 1
end

try_load_students
interactive_menu
