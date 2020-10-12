class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @board = Board.find(params[:board_id])
    @task = Task.find(params[:task_id])
    @comment = current_user.comments.build(board_id: @board.id, task_id: @task.id)
  end

  def create
    @board = Board.find(params[:board_id])
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comments_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to board_task_path(board_id: @board.id, id: @task.id)
    else
      render :new
    end
  end

  def index
    @task = Task.find(params[:task_id])
    @comments = @task.comments.all
  end

  def edit
    @comment = Comment.find(params[:id])
    @board = Board.find(params[:board_id])
    @task = Task.find(params[:task_id])
  end

  def update
    @board = Board.find(params[:board_id])
    @task = Task.find(params[:task_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comments_params)
      redirect_to board_task_path(board_id: @board.id, id: @task.id)
    else
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:board_id])
    task = Task.find(params[:task_id])
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_to board_task_path(board_id: board.id, id: task.id)
  end

  private
    def comments_params
      params.require(:comment).permit(:content).merge(board_id: @board.id)
    end
end

