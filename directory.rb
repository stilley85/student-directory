def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        student = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  cohorts = [
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
  # get the first names
  name = gets.strip
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What is #{name}'s nationality?"
    nationality = gets.strip
    puts "What are #{name}'s hobbies?"
    hobbies = gets.strip
    puts "What cohort does #{name} belong to?"
    cohort = gets.strip.downcase
    while !cohorts.include?(cohort.to_sym)
      if cohort == ""
        cohort = :november
        break
      end
      puts "No such cohort"
      cohort = gets.strip.downcase
    end
    # add the student hash to the array
    students << {
      name: name,
      cohort: cohort,
      nationality: nationality,
      hobbies: hobbies
    }
    if students.count == 1
      puts "Now we have 1 student"
    elsif students.count > 1
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.strip
  end
  # return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy".center(75)
  puts "--------------".center(75)
end

def print(students)
  count = 0
  while count < students.length
    puts "#{students[count][:name]} is #{students[count][:nationality]} and "\
    "he likes #{students[count][:hobbies]}. He is from the "\
    "#{students[count][:cohort]} cohort".center(75)
    count += 1
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have 1 great student".center(75)
  elsif
    puts "Overall, we have #{names.count} great students".center(75)
  end
end

interactive_menu
