class RepliesController < ApplicationController
  def show
  end

  def new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    reply = Topic.find(params[:topic_id]).replies.new(reply_params)
    reply.user_id = current_user.id
    if reply.save
      redirect_to reply.topic, notice: "Thanks for your reply."
    else
      render :new
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:body)
  end
end
