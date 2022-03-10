class CommentController < ApplicationController

  def index
    if params.has_key?(:user_id)
      @comments = Comment.where(comment_id: params[:user_id])
    elsif params.has_key?(:artwork_id)
      @comments = Comment.where(comment_id: params[:@artwork_id])
    else
      @comments = Comment.all
    end
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to comments_url
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter_id, :artwork_id, :body)
  end

end