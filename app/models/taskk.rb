class Taskk < ApplicationRecord
	belongs_to :task_list , optional: true
	has_many :activities,  inverse_of: :taskk
	accepts_nested_attributes_for :activities
	validates :task_consumer_no, presence: true


require 'csv'
after_create_commit :set_customer_details, :set_task_parameters
#after_save :set_customer_details

#@@customers = User.first.customers


def self.to_csv(options = {})
		desired_columns = ["Sr no","Consumer no", "Task Date", "Party Name","Allocation","status", "Activity", "Priority"]
		CSV.generate(options) do | xls |
			xls << desired_columns
			all.each do |m|
				xls << ["#{m.id}","#{m.task_consumer_no}", "#{m.created_at.strftime("%d-%m-%y")}", "#{m.customer_name}","#{m.allocated_to}","#{m.status}", "#{m.activity}", "#{m.priority}"]
			end
		end
	end



 def self.search(search)
    if search
      find(:all, :conditions => ['consumer_no LIKE ?', "%#{search}%"])
    
    end
 end

def self.done_tasks(param)
	@done_tasks=[]
	param.each do |x|
	if  x.status == "Done"
		@done_tasks.push(x)
	end
	end
	@done_tasks
end

def self.not_done_tasks(param)
 	@not_done_tasks=[]
	param.each do |x|
	if  x.status == "Not Done"
		@not_done_tasks.push(x)
	end
	end
	@not_done_tasks
end

def self.do_it_on_date_tasks(param)
	@do_it_on_date_tasks=[]
	param.each do |x|
	if  x.status == "Do it on Date"
		@do_it_on_date_tasks.push(x)
	end
	end
	@do_it_on_date_tasks
 end

def sort_by_client_number
	
end

def sort_by_employee
	
end

def sort_by_activity
	
end

def set_customer_details
	@task = Taskk.find(self.id)
	@customer=[]
	User.customers.each do |x|
		if x["consumer_no"] == @task.task_consumer_no
			@customer=x
		end
	end
    @task.customer_name = @customer["name"]
    @task.customer_phone_number = @customer["phone_number"]
    @task.customer_address = @customer["address"] 
    @task.customer_area = @customer["area"]
    @task.customer_flavors = @customer["flavors"]
    @task.customer_machine_count = @customer["machine_count"]
    @xy =TaskList.find(@task.task_list_id)
	@task.allocated_to = @xy.allocated_to
	@task.activity = Activity.where(:taskk_id => self.id).first.name
	@task.task_consumer_no_id = @task.id
    @task.save
end

def set_task_parameters
	@task = Taskk.find(self.id)
	
end

end