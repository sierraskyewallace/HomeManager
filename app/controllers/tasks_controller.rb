class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @family = Family.find(params[:id])
    render json: @family.tasks, include: ['tasks.user']
  end

  def new
    @task = Task.new
  end

  def create
    @task = Family.find(params[:id]).tasks.build(task_params)
    if @task.save
      redirect_to family_path(current_family)
    else
      render template: 'tasks/new'
    end
  end

  def show
    render json: @task, include: ['tasks.user']
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to family_path(@task.family_id)
    else
      render template: 'tasks/edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to family_path(current_family)
  end

  private
  def task_params
    params.require(:task).permit(:name, :family_id)
  end

  def set_task
    @task = task.find(params[:id])
  end
end