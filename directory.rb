def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first names
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def names_starts_with
  puts "Choose a letter to search for students with names starting with that letter"
  puts "Or just hit return to see all students"
  letter = gets.chomp.downcase
end

def print(students, letter)
  students.each.with_index(1) do |student, index|
    if student[:name].length < 12
      if letter.empty?
        puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
      elsif student[:name].downcase.start_with?(letter)
        puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
letter = names_starts_with
print_header
print(students, letter)
print_footer(students)
