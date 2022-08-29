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
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  # def create
  #   @restaurant = Restaurant.new(params[:restaurant])
  #   @restaurant.save # Will raise ActiveModel::ForbiddenAttributesError
  # end
end
