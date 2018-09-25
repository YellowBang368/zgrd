class ConversationsController < ApplicationController
  before_action :authenticate_user!
  after_action :read_messages_in, only: [:index], if: -> { @read_messages == true}

  def index
    if conversation_params[:conversation_id].present?
      if conversation_exists?(conversation_params[:conversation_id])
        redirect_back fallback_location: root_path unless conversation_belons_to_user?(conversation_params[:conversation_id])
        @conversation = Conversation.find(conversation_params[:conversation_id])
        @read_messages = true
      else
        @read_messages = false
      end
    end
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

  def destroy
    Conversation.find(params[:id]).destroy
    redirect_to conversations_path
  end

  private
  def read_messages_in
    unread_messages = Conversation.find(conversation_params[:conversation_id]).messages.where.not(user_id: current_user.id, read: true)
    unread_messages.each do |msg|
      msg.read = true
      msg.save!
    end
  end

  def conversation_exists?(conversation_id)
    Conversation.find(conversation_id).present?
  end

  def conversation_belons_to_user?(conversation_id)
    @conversation = Conversation.find(conversation_id)
    @conversation.sender == current_user || @conversation.recipient == current_user
  end

  def conversation_params
    params.permit(:sender_id, :recipient_id, :conversation_id)
  end
end
