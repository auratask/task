class AddFieldsToTaskks < ActiveRecord::Migration[5.0]
  def change
    add_column :taskks, :customer_name, :string
    add_column :taskks, :customer_phone_number, :string
    add_column :taskks, :customer_address, :text
    add_column :taskks, :customer_area, :string
    add_column :taskks, :customer_flavors, :string
    add_column :taskks, :customer_machine_count, :integer
  end
end
