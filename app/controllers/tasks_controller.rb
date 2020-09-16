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

  private
    def tasks_params
      params.require(:task).permit(:title, :content, :deadline)
    end
end

