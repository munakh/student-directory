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
    if students.count < 2
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
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
  puts "Enter month:"
  month = gets.chomp
  puts "Name".center(10) +
  "Age".center(10) +
  "Hobbies".center(35) +
  "Cohort".center(25)
  puts "---------------------------------------------------------------------------"
  cohorts = students.map {|student| student[:cohort]}.uniq
  cohorts.each do |cohort_month|
    if cohort_month == month
      matched = students.select { |student| student[:cohort] == month }
      matched.each do |student| puts "#{index += 1}." +
        "#{student[:name]}".center(10) +
        "(#{student[:age]})".center(10) +
        "(Hobbies:#{student[:hobbies]})".center(35) +
        "(#{student[:cohort]} cohort)".center(25)
      end
    end
  end
  index += 1
end

def print_footer(students)
  if students.count < 2
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)