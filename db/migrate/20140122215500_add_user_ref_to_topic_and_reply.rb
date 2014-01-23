class AddUserRefToTopicAndReply < ActiveRecord::Migration
  def change
    add_reference :topics, :user, index: true
    add_reference :replies, :user, index: true
  end
end
