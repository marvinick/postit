class CommentsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :vote]

  def create
    @post = Post.find_by slug: params[:post_id]
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Your comment was added"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        flash[:notice] = "Your vote for this comment was counted"
        redirect_to :back
      end
      format.js
    end
  end
end
