class AddTaskListIdToTaskk < ActiveRecord::Migration[5.0]
  def change
    add_column :taskks, :task_list_id, :integer
  end
end
