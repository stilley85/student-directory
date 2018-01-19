@students = []
@centre_width = 75
@cohorts = [
  :january,
  :february,
  :march,
  :april,
  :may,
  :june,
  :july,
  :august,
  :september,
  :october,
  :november,
  :december
]

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      students = input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.strip.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What cohort does #{name} belong to?"
    cohort = check_for_cohort
    @students << {name: name, cohort: cohort}
    puts print_student_count
    # get another name from the user
    puts "Enter another name or hit return to finish"
    name = gets.strip.capitalize
  end
end

def check_for_cohort
  cohort = gets.strip.downcase.to_sym
  while !@cohorts.include?(cohort)
    if cohort == :""
      cohort = :november
      break
    end
    puts "No such cohort"
    cohort = gets.strip.downcase.to_sym
  end
  cohort
end

def print_student_count
  @students.count > 1 ? "Now we have #{@students.count} students" : "Now we have 1 student"
end

def print_header
  puts "The students of Villains Academy".center(@centre_width)
  puts "--------------".center(@centre_width)
end

def print_students_list
  count = 0
  while count < @students.length
    puts "#{@students[count][:name]} is from the"\
    " #{@students[count][:cohort].capitalize} cohort".center(@centre_width)
    count += 1
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student".center(@centre_width)
  elsif
    puts "Overall, we have #{@students.count} great students".center(@centre_width)
  end
end

interactive_menu
