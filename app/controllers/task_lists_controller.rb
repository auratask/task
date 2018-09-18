class TaskListsController < ApplicationController
  
      
   def create
      @task_list = TaskList.new(task_list_params)
      @task_list.save
      redirect_to task_lists_path
   end

  

  def new
  	@consumer_nos = User.consumer_nos
  	@x=0
  	@task_list = TaskList.new
    @task_list.taskks.build.activities.build
   
  end

  def show
  end

  def edit
  end

  def index
  	@task_lists = TaskList.all
  end

 private 

   def task_list_params
      params.require(:task_list).permit(:id, :task_list_date,:expense, :allocated_to, taskks_attributes: [:id,:task_consumer_no, :status,:cheque_cash_detail,:instruction, :allocated_to, :priority, activities_attributes:[:id, :name]])
   end

end
