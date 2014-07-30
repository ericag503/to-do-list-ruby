require './lib/Task'
require './lib/List'

@lists = []
@current_list = nil

def main_menu
  loop do
    puts "Press 'c' to create a list. Press 's' to select a list."
    puts "Press 'a' to add a task or 'l' to list all of your tasks."
    puts "Press 'f' to mark a task as finished. Press 'z' to show completed tasks."
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
    elsif main_choice == 'f'
        finish_task
    elsif main_choice == 'z'
        show_finished
    elsif main_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def create_list
  puts "\n\n"
  puts "Please enter the name of your list."
  user_list_name = gets.chomp
  @lists << List.new(user_list_name)
  puts "\n\n"
  puts "List #{user_list_name} created!"
  puts "\n\n"
end

def select_list
  puts "\n\n"
  puts "Here are your lists:"
  @lists.each_with_index do |list, i|
    puts "#{i+1}. #{list.list_name}"
  end
  puts "\n\n"
  puts "Type the number of the list you want to select."
  @list_number = gets.chomp
  @current_list = @lists[(@list_number.to_i)-1]
  puts "\n\n"
end

def add_task
  if @current_list == nil
    puts "\n\n"
    puts "Please select a list first."
    puts "\n\n"
  else
    puts "\n\n"
    puts "Enter a description of the new task:"
    puts "\n\n"
    user_description = gets.chomp
    @current_list.tasks << Task.new(user_description)
    puts "\n\n"
    puts "Task added.\n\n"
  end
end

def list_tasks
  if @current_list == nil
    puts "\n\n"
    puts "Please select a list first."
    puts "\n\n"
  else
    puts "\n\n"
    puts "Here are all of your tasks:"
    @current_list.tasks.each_with_index do |task, i|
      puts "#{i+1}. #{task.description}"
    end
  end
  puts "\n"
end

def finish_task
  if @current_list == nil
    puts "\n\n"
    puts "Please select a list first."
    puts "\n\n"
  else
    puts "\n\n"
    puts "Enter which task number you want to mark finished:"
    user_task_number = gets.chomp
    user_task_number.to_i
    @current_list.finish_task(user_task_number.to_i)
    puts "Task #{user_task_number} deleted!"
    puts "\n\n"
  end
end

def show_finished
  if @current_list == nil
    puts "\n\n"
    puts "Please select a list first."
    puts "\n\n"
  else
    puts "\n\n"
    puts "Here are your completed tasks:"
    @current_list.finished.each_with_index do |task, i|
      puts "#{i+1}. #{task.description}"
    end
    puts "\n\n"
  end
end



main_menu
