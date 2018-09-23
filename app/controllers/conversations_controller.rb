class ConversationsController < ApplicationController
  before_action :authenticate_user!

  # При вызове post conversation_path вызывает create, после редирект на get conversation_path => index

  def index
    redirect_back fallback_location: root_path unless conversation_belongs_to_user?(conversation_params[:conversation_id])
    @conversation = Conversation.find(conversation_params[:conversation_id])
    read_messages_in(@conversation)
    @users = User.all
    @conversations_with_current_user = Conversation.where('sender_id=' + current_user.id.to_s + ' OR ' + 'recipient_id=' + current_user.id.to_s)
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversations_path(conversation_id: @conversation.id)
  end

  private
  def read_messages_in(conversation)
    unread_messages = conversation.messages.where.not(user_id: current_user.id, read: true)
    unread_messages.each do |msg|
      msg.read = true
      msg.save!
    end
  end

  def conversation_belongs_to_user?(conversation_id)
    conversation = Conversation.find(conversation_id)
    conversation.sender == current_user || conversation.recipient == current_user
  end

  def conversation_params
    params.permit(:sender_id, :recipient_id, :conversation_id)
  end
end
