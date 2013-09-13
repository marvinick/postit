class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "You created a post"
      redirect_to root_path
    else
    	render :new
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:notice] = "This post was updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit!
  end

end
