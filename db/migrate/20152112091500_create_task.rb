require_relative '../../config/application.rb'

class CreateTask < ActiveRecord::Migration
  def change

    create_table :tasks do |t|
      t.string :task_name
      t.boolean :completed, default: :false
      t.timestamps null: false
    end
  end
end