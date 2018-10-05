class CreateTaskConsumerNos < ActiveRecord::Migration[5.0]
  def change
    create_table :task_consumer_nos do |t|
      t.integer :task_consumer_no_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
