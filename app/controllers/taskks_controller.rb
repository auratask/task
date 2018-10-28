class TaskksController < ApplicationController
  def new
  end

  def show
    @taskk =Taskk.find(params[:id])
    respond_to do |format|
      format.html
      
    end
  end

  def edit
    @taskk = Taskk.find(params[:id])
  end

  def update
    @taskk  =Taskk.find(params[:id])
    @taskk.update_attributes(task_params)
    redirect_to taskk_path(@taskk)
  end


  def sort_by
    if params[:search].present?
       @tasks = Taskk.search(params[:search])
    end
  end

  def index
  	@tasks = Taskk.all.order(created_at: :desc)
    @customers= User.customers
  	respond_to do | format|
  	  format.html
  	  format.csv {send_data @tasks.to_csv }
  	  format.xls {send_data @tasks.to_csv(col_sep: "\t") }
  	end
  end

private 

   def task_params
      params.require(:taskk).permit(:id,:task_consumer_no, :customer_name, :status,:cheque_cash_detail, :remark, :instruction, :allocated_to,:refill_count, :done_count, :return_count, :priority, activities_attributes:[:id, :name])
   end

end
