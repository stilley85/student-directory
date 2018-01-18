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
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What is #{name}'s nationality?"
    nationality = gets.chomp
    puts "What are #{name}'s hobbies?"
    hobbies = gets.chomp
    puts "What cohort does #{name} belong to?"
    cohort = gets.chomp.downcase
    while !cohorts.include?(cohort.to_sym)
      if cohort == ""
        cohort = :november
        break
      end
      puts "No such cohort"
      cohort = gets.chomp.downcase
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
    name = gets.chomp
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

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
