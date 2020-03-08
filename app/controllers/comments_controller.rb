class CommentsController < ApplicationController
  http_basic_authenticate_with name: "bob", password: "1234", 
  only: [:destroy] # this means user can read comments, but cannot destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private 
  
  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
