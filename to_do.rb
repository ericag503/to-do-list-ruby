require './lib/Task'
require './lib/List'

@lists = []
@current_list = ''

def main_menu
  loop do
    puts "Press 'c' to create a list. Press 's' to select a list."
    puts "Press 'a' to add a task or 'l' to list all of your tasks."
    puts "Press 'x' to exit."
    main_choice = gets.chomp

    if main_choice == 'c'
      create_list
    elsif main_choice == 's'
      select_list
    elsif main_choice == 'a'
      add_task
    elsif main_choice == 'l'
      list_tasks
    elsif main_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def create_list
  puts "Please enter the name of your list."
  user_list_name = gets.chomp
  @lists << List.new(user_list_name)
  puts "List #{user_list_name} created!"
end

def select_list
  puts "Here are your lists:"
  @lists.each_with_index do |list, i|
    puts "#{i+1}. #{list.list_name}"
  end
  puts "Type the number of the list you want to select."
  list_number = gets.chomp
  @current_list = @lists[(list_number.to_i)-1]
  puts @current_list
end

# def add_task
#   puts "Enter a description of the new task:"
#   user_description = gets.chomp
#   @list << Task.new(user_description)
#   puts "Task added.\n\n"
# end

# def list_tasks
#   puts "Here are all of your tasks:"
#   @list.each do |task|
#     puts task.description
#   end
#   puts "\n"
# end

main_menu
