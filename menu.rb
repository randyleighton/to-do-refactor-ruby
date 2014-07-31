require './lib/task.rb'
require './lib/list.rb'

@lists = []
@current_list = nil

def main_menu
  loop do
    puts "[== Main Menu ==]"
    puts "[c] create new list"
    puts "[d] display lists"
    puts "press 'x' to exit"
    menu_choice = gets.chomp
    if menu_choice == 'c'
      create_list
    elsif menu_choice == 'd'
      display_lists
    elsif menu_choice == 'x'
      puts "bye"
      exit
    else
      puts "sorry not a valid entry"
    end
  end
end

def create_list
  puts "Enter a new list: "
  inputted_list = gets.chomp
  List.new(inputted_list).save
  @current_list = List.all.last
  task_menu
end

def display_lists
  puts "[== Your current to do lists ==]"
  List.all.each_with_index do |list,index|
    puts index.to_s + " " + list.name
    end
  puts "\nChoose the number you want: "
  list_choice = gets.chomp.to_i
  @current_list = List.all[list_choice]
  puts "The list you chose is:  #{@current_list.name}\n"

  # puts "The list you chose is:  #{List.all[list_choice].name}\n"
  task_menu
end

def task_menu
  loop do
    puts "[== Your task options ==]"
    puts "[a] add a task"
    puts "[l] list tasks"
    puts "[m] mark task complete"
    puts "[d] delete a task"
    puts "[s] sort all tasks"
    puts "[x] exit to main menu"
    menu_choice = gets.chomp
    if menu_choice == 'a'
      add_task
    elsif menu_choice == 'l'
      list_tasks
    elsif menu_choice == 'm'
      mark_task
    elsif menu_choice == 'd'
      delete_task
    elsif menu_choice == 's'
      sort_tasks
    elsif menu_choice == 'x'
      puts "\n\n"
      main_menu
    else
      puts "sorry not a valid entry"
    end
  end
end

def add_task
  puts"Enter task here:"
  user_description = gets.chomp
  @current_list.add_task(Task.new(user_description))
  current_task = @current_list.tasks.last
  puts "Priority [1] - [5]"
  task_priority = gets.chomp.to_i
  current_task.set_priority(task_priority)
  puts "Date due   xx / xx / xx"
  task_date = gets.chomp
  current_task.set_date(task_date)
  puts "task added.\n\n"
end

def list_tasks
  puts "Here are your tasks:"
  @current_list.tasks.each do |task|
  puts task.description + ", Status: " + task.status + ", Priority: " +
       task.priority.to_s + ", Due Date: " + task.date
  end
  puts "\n"
end

def list_with_index
  @current_list.tasks.each_with_index do |task, index|
    puts index.to_s + ", " + task.description + ", Status: " + task.status + ", Priority: " +
         task.priority.to_s + ", Due Date: " + task.date
  end
  puts "\n"
end

def mark_task
  puts "Choose the task number you want to mark as complete"
  list_with_index
  task_choice = gets.chomp.to_i
  @current_list.tasks[task_choice].set_status("Complete")
  puts "#{@current_list.tasks[task_choice].description} is now marked Complete\n"
  puts "\nHere are your current tasks:"
  list_with_index

end

def delete_task
  puts "Choose the task number you want to delete"
  list_with_index
  task_choice = gets.chomp.to_i
  @current_list.tasks.delete_at(task_choice)
  puts "\nHere are your current tasks:"
  list_with_index
end

def sort_tasks
  puts "How do you want to sort?"
  puts "[p] priority [d] date [n] task name"
  task_choice = gets.chomp
  puts "Sorting the objects!\n"
  @current_list.tasks_by(task_choice)
  puts "\nSorted list:"
  list_with_index
end

main_menu
