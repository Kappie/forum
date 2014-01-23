class AddTopicRefToReply < ActiveRecord::Migration
  def change
    add_reference :replies, :topic, index: true
  end
end
