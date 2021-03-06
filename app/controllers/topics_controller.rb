class TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :user_allowed, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all.order("created_at DESC")
  end

  def show

  end

  def new
    @topic=current_user.topics.build
  end

  def create
    @topic=current_user.topics.build(topic_params)

    if @topic.save
      redirect_to @topic
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
      @topic.destroy
      redirect_to topics_path
  end

  private

  def find_topic
    @topic=Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :content)
  end

  def user_allowed
    unless @topic.user == current_user
      redirect_to(topic_path, notice: 'You are not authorized to perform that action')
    end
  end

end
