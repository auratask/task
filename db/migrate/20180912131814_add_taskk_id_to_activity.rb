class AddTaskkIdToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :taskk_id, :integer
  end
end
