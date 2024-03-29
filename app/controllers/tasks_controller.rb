class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    render :edit
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to list_path(params[:list_id])
    else
      render :edit
    end
  end

  def mark
    @task = Task.find(params[:id])
    @task.update_attribute(:done, true)
    redirect_to list_path(params[:list_id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_path(params[:list_id])
  end



  private

    def task_params
      params.require(:task).permit(:description)
      # params.require(:task).permit(:done)
    end
end
