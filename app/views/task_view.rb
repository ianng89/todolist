require 'byebug'
require_relative '../../config/application'
require_relative '../controllers/tasks_controller.rb'

def main_screen
puts
linebreak = '============================='

puts linebreak
puts "HOW TO USE TODO LIST APP"
puts linebreak
puts "task_view.rb list => VIEW LIST || task_view.rb add => ADD ITEM || task_view.rb delete => DELETE TASKS || task_view.rb update => UPDATE tasks "
puts linebreak
puts "id |    Task Name   | Completion (0 = not completed, 1 = completed)"
end

def tasks_list
	tasks = TasksController.list
	tasks.each do |t|
		p t.id.to_s + " " + t.task_name + " " + "[#{t.completed.to_s}]"
	end
	if tasks.empty?
		puts "No tasks here, please add one"
	end
end

def tasks_add(taskname)
	TasksController.add(taskname)

	p "'" + taskname + "' " + 'has been added to the list'
	print tasks_list
end

def tasks_delete(id_delete)
	# print tasks_list
	# puts "Which task do you want to delete? (Select ID #)"
	# id_delete = gets.chomp
	TasksController.delete(id_delete)
	# puts "Task #{id_delete} has been deleted"
	print tasks_list
end

def tasks_update(id_update)
	# print tasks_list
	# puts "Which task do you want to mark as complete? (Select ID #)"
	# id_update = gets.chomp
	TasksController.update(id_update)
	puts "Task #{id_update} has been marked as completed"
	print tasks_list
end

def tasks_update_incomplete(id_update)
	# print tasks_list
	# puts "Which task do you want to mark as complete? (Select ID #)"
	# id_update = gets.chomp
	TasksController.update_incomplete(id_update)
	puts "Task #{id_update} has been marked as incomplete"
	print tasks_list
end

def tasks_delete_all
	TasksController.delete_all
	print tasks_list 
end

def menu
 if ARGV.any?

 	case ARGV[0]
 		when "list"
 		tasks_list
 		when 'add'
 		tasks_add(ARGV[1..-1].join(" "))
 		when 'delete'
 		tasks_delete(ARGV[1])
 		when 'deleteall'
 		tasks_delete_all
 		when 'update'
 		tasks_update(ARGV[1])
 		when 'reupdate'
 		tasks_update_incomplete(ARGV[1]) 	
 	else
 	main_screen
 	end
 	
 end
end
menu
# main_screen
# tasks_list
# puts"What task do you want to add?"
# taskname = gets.chomp
# tasks_add(taskname)
# tasks_delete
# tasks_update