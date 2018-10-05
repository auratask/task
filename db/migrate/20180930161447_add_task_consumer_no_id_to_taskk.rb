class AddTaskConsumerNoIdToTaskk < ActiveRecord::Migration[5.0]
  def change
    add_column :taskks, :task_consumer_no_id, :integer
  end
end
