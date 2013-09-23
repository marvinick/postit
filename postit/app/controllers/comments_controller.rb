class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Your comment was added"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    Vote.create(voteable: @comment, user: current_user, vote: params[:vote])
    flash[:notice] = "Your vote for this comment was counted"
    redirect_to comment_path(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end