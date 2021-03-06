class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create 
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    @comment.user_id = current_user.id
    @user = User.find(@photo.user_id)
    @username = @user.username
    @comment.username = @username
    @comment.save
    redirect_to photos_path
    # refactor this down (in the same way as photos)
  end

  def comment_params
    params.require(:comment).permit(:comment, :image)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted successfully'
    redirect_to '/photos'
  end

end
