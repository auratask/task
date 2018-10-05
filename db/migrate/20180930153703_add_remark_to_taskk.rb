class AddRemarkToTaskk < ActiveRecord::Migration[5.0]
  def change
    add_column :taskks, :remark, :string
  end
end
