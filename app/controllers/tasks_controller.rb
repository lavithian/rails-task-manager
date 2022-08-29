class TasksController < ApplicationController
  def index; end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    rediret_to task_path(task)
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:id]) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def destroy
    @task = task.find(params[:id])
    task.destroy(params[:id])
    redirect_to task_path(@task)
  end
end
