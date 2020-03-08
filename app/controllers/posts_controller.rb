class PostsController < ApplicationController
  http_basic_authenticate_with name: "justin", password: "1234", 
  except: [:index, :show] # this means you go to to those pages w/o authenticating

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    # below line will retrieve a hash of the title and body submitted by /posts/new
    # render plain: params[:post].inspect

    @post = Post.new(post_params)
    if @post.save
      redirect_to @post # this redirects to the "show" view
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post # this redirects to the "show" view
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path # what is posts_path? 
  end

  private

  def post_params
    # this method is a way of whitelisting fields, to prevent malicious users from setting attributes on their side
    params.require(:post).permit(:title, :body)
  end
end
