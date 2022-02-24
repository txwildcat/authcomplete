class TasksController < ApplicationController
  def index
    @tasks = Task.where({ user_id: session[:user_id] })
    @task = Task.new
  end

  def create
    if @current_user
      @task = Task.new(params["task"])
      @task.save
    end
    
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find(params["id"])
    if @current_user && @task.user_id == @current_user.id
      @task.destroy
    end

    redirect_to "/tasks"
  end
end
