class CreateTaskks < ActiveRecord::Migration[5.0]
  def change
    create_table :taskks do |t|
      t.string :task_consumer_no
      t.string :status
      t.string :cheque_cash_detail
      t.string :instruction
      t.string :activity
      t.string :allocated_to
      t.string :priority

      t.timestamps
    end
  end
end
