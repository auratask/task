class TaskList < ApplicationRecord
	has_many :taskks , inverse_of: :task_list
	has_many :activities , through: :taskks 
	accepts_nested_attributes_for :taskks , :allow_destroy => true
	validates :allocated_to , presence: true 
	validates :expense , presence: true
	validates :task_list_date , presence: true

	
end

