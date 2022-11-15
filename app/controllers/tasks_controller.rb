class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    id = params[:id]
    @task = Task.find(id)
  end

  def new
    @task = Task.new
  end

  def create
    # id = params[:id]
    @task = Task.new(task_param)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    id = params[:id]
    @task = Task.find(id)
  end

  def update
    id = params[:id]
    @task = Task.find(id)
    @task.update(task_param)
    redirect_to task_path
  end

  def destroy
    id = params[:id]
    @task = Task.find(id)
    @task.destroy
    redirect_to task_path
  end

private

def task_param
  params.require(:task).permit(:title, :details, :completed)
end
end
