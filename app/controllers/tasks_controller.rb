class TasksController < ApplicationController
  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(tasks_params)
    if @task.save
      redirect_to board_tasks_path
    else
      render :new
    end
  end

  def index
    @board = Board.find(params[:board_id])
    @tasks = @board.tasks.all
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    if @task.update(rasks_params)
      redirect_to board_tasks_path
    else
      render :edit
    end
  end

  private
    def tasks_params
      params.require(:task).permit(:title, :content, :deadline)
    end
end

