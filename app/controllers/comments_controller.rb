class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_allowed, only: [:edit, :update, :destroy]

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.create(params[:comment].permit(:comment))
    @comment.user = current_user

    if @comment.save
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    @comment.destroy
    redirect_to topic_path(@topic)
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])

    if @comment.update(params[:comment].permit(:comment))
      redirect_to topic_path(@topic)
    else
      render 'edit'
    end
  end

  private

  def user_allowed
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.find(params[:id])
    unless @comment.user == current_user
      redirect_to(topic_path(@topic), notice: 'You are not authorized to perform that action')
    end
  end

end
