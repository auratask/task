class AddCountsToTaskks < ActiveRecord::Migration[5.0]
  def change
    add_column :taskks, :refill_count, :integer
    add_column :taskks, :done_count, :integer
    add_column :taskks, :return_count, :integer
  end
end
