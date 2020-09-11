class TasksController < ApplicationController
  def new
    board = Board.find(params[:board_id])
    @task = board.task.build
  end

  def index
    board = Board.find(params[:board_id])
    @tasks = Task.all
  end

end
