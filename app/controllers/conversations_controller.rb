class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations_with_current_user = Conversation.where('sender_id=' + current_user.id.to_s + ' OR ' + 'recipient_id=' + current_user.id.to_s)
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversations_path
  end

  private
  def conversation_exist?
    true
  end

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
