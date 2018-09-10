class TaskksController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def index
  	@tasks = Taskk.all
  	@customers= User.customers
  	respond_to do | format|
  	  format.html
  	  format.csv {send_data @tasks.to_csv }
  	  format.xls {send_data @tasks.to_csv(col_sep: "\t") }
  	end
  end
end
