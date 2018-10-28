class TaskListsController < ApplicationController
  
      
   def create
      @task_list = TaskList.new(task_list_params)
      if @task_list.save
      redirect_to task_list_path(@task_list)
    else 
      flash[:error] = "Please submit all fields"
      redirect_to new_task_list_path

    end
   end

  

  def new
  	@consumer_nos = User.consumer_nos
  	@x=0
  	@task_list = TaskList.new
    @task_list.taskks.build.activities.build
   
  end

  def show
    @task_list =TaskList.find(params[:id])
    @task_list.taskks.each do |x|
        if x.customer_name.nil? 
          Taskk.set_task_parameters(x.id)
        end
      end
    
    respond_to do |format|
      format.html
      
    end
  end

  def destroy
      @task_list = TaskList.find(params[:id])
      @task_list.destroy
 
      respond_to do |format|
        format.html { redirect_to task_lists_url }
        format.json { head :no_content }
      end
  end

  def edit
    @list =TaskList.find(params[:id])
     
    @list.taskks.each do |x|
        if x.customer_name.nil? 
          Taskk.set_task_parameters(x.id)
        end
      end
    
    @consumer_nos = User.consumer_nos
    @task_list =TaskList.find(params[:id])
  end

  def update
    @task_list =TaskList.find(params[:id])
    @task_list.update_attributes(task_list_params)
    redirect_to task_list_path(@task_list)
  end

  def index
  	@task_lists = TaskList.all.order(created_at: :desc)
  end

 private 

   def task_list_params
   	  params["task_list"]["taskks_attributes"].delete_if {|k,v| v["task_consumer_no"] ==""}
      params.require(:task_list).permit(:id, :task_list_date,:expense, :expense_utilized, :allocated_to, taskks_attributes: [:id,:task_consumer_no, :customer_name, :status,:cheque_cash_detail, :remark, :instruction, :allocated_to, :priority, activities_attributes:[:id, :name]])
   end

end
