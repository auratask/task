class Taskk < ApplicationRecord
after_create_commit :set_customer_details

@@customers = User.customers


def self.to_csv(options = {})
		desired_columns = ["Sr no","Consumer no", "Task Date", "Party Name","Allocation","status", "Activity", "Priority"]
		CSV.generate(options) do | csv |
			csv << desired_columns
			all.each do |m|
				csv << ["#{m.id}","#{m.task_consumer_number}", "#{m.created_at.strftime("%d-%m-%y")}", "#{m.customer_name}","#{m.allocated_to}","#{m.status}", "#{m.activity}", "#{m.priority}"]
			end
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

def set_customer_details
	@task = Taskk.find(self.id)
	@customer=[]
	@@customers.each do |x|
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
    @task.save
end


end