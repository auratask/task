class AddExpenseUtilizedToTaskList < ActiveRecord::Migration[5.0]
  def change
    add_column :task_lists, :expense_utilized, :integer
  end
end
