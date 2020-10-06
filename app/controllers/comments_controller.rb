class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    task = Task.find(params[:task_id])
    @comment = task.comments.build
  end

  def create
    task = Task.find(params[:task_id])
    @comment = task.comments.build(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to task_comments_path
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
    @task = Task.find(params[:task_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comments_params)
      redirect_to task_comments_path
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_to task_comments_path
  end

  private
    def comments_params
      params.require(:comment).permit(:content)
    end
end

