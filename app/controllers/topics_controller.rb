class TopicsController < ApplicationController
  def show
    @topic = Topic.find(params[:id])  
  end

  def new
    @board = Board.find(params[:board_id])
  end

  def create
    topic = Board.find(params[:board_id]).topics.new(topic_params)
    topic.user_id = current_user.id
    if topic.save
      redirect_to topic.board, notice: "Thanks for posting."
    else
      render :new
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body)
  end
end
