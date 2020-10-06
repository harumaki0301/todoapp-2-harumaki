class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def new
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.build(board_id: @board.id)
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(tasks_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to board_tasks_path
    else
      render :new
    end
  end

  def show
    
  end

  def index
    @board = Board.find(params[:board_id])
    @tasks = @board.tasks.all
  end

  def edit
    @task = Task.find(params[:id])
    @board = Board.find(params[:board_id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      redirect_to board_tasks_path
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy!
    redirect_to board_tasks_path
  end

  private
    def tasks_params
      params.require(:task).permit(:title, :content, :deadline)
    end
end
