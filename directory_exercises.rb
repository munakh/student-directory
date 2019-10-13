def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  default_cohort = "November"
  name = gets.chomp
  while !name.empty? do
    hobbies = []
    puts "Enter age"
    age = gets.chomp
    while true
      puts "Enter hobby"
      hobby = gets.chomp
      if hobby != "done"
        hobbies.push(hobby)
      end
    break if hobby == "done"
    end
    puts "Enter cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = default_cohort
    end
    until
      ["January", "February", "March",
      "April", "May", "June", "July",
      "August", "September", "October",
      "November", "December"].include?(cohort)
      puts "Please enter a valid cohort"
      cohort = gets.chomp
    end
    students << {name: name, cohort: cohort, age: age, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  index = 0
  puts "Name".center(10) +
  "Age".center(10) +
  "Hobbies".center(35) +
  "Cohort".center(25)
  puts "------------------------------------------------------------------------"
  while index < students.length do
    if students[index][:name][0] == "H" && students[index][:name].length < 12
      puts "#{index + 1}. #{students[index][:name]}" +
      "(#{students[index][:age]})".center(10) +
      "(Hobbies:#{students[index][:hobbies]})".center(35) +
      "(#{students[index][:cohort]} cohort)".center(25)
    end
  index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)