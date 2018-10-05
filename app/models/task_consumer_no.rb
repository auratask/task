class TaskConsumerNo < ApplicationRecord
	has_many :taskks , inverse_of: :task_consumer_no
	has_many :activities , through: :taskks

end
