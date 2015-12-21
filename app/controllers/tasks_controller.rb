require '../models/task_model.rb'

class TasksController < ActiveRecord::Base

	def self.list
		Task.all
	end

	def self.add(taskname)
		Task.create(task_name: taskname, completed: 0)
	end

	def self.delete(id)
		Task.delete(id)
		# Task.reset_pk_sequence
	end

	def self.update(id)
		task = Task.find(id)
		task[:completed] = 1
		task.save
	end

	def self.update_incomplete(id)
		task = Task.find(id)
		task[:completed] = 0
		task.save
	end

	def self.delete_all
		Task.delete_all
	end
end

