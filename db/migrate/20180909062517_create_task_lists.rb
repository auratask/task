class CreateTaskLists < ActiveRecord::Migration[5.0]
  def change
    create_table :task_lists do |t|
      t.integer :expense
      t.string :allocated_to
      t.datetime :task_list_date

      t.timestamps
    end
  end
end
