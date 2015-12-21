require_relative '../models/task_model.rb'

class TasksController < ActiveRecord::Base

	def self.list
		Task.all
	end

	def self.add(taskname)
		Task.create(id: Task.count+1, task_name: taskname, completed: " ")
	end

	def self.delete(id)
		Task.delete(id)
		Task.where("id > ?", id).each do |x|
			x.id = x.id - 1
			x.save
		end
		
	end

	def self.update(id)
		task = Task.find(id)
		task[:completed] = 'X'
		task.save
	end

	def self.update_incomplete(id)
		task = Task.find(id)
		task[:completed] = " "
		task.save
	end

	def self.delete_all
		Task.delete_all
		# ActiveRecord::Base.connection.execute(tasks)
	end
end

