def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
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
    students << {name: name, cohort: :November, age: age, hobbies: hobbies}
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
  while index < students.length do
    if students[index][:name][0] == "H" && students[index][:name].length < 12
      puts "#{index + 1}. #{students[index][:name]}" +
      "(#{students[index][:age]})" +
      "(Hobbies:#{students[index][:hobbies]})" +
      "(#{students[index][:cohort]} cohort)"
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