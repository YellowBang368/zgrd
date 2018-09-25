class CommentsController < ApplicationController

  def new
    redirect_back fallback_location: root_path unless user_signed_in? # "fallback_location" redirect to root if no previous page
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.sender_id = current_user.id
    if @comment.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:title, :text, :user, :sender_id)
  end
end

# Overflow текста
# Избранное
# Удалить диалог
# Редактировать продукт
# Удалить продукт
# отложенные в сессиях
