class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
      if @comment.save
        flash[:notice] = "Comment added successfully"
        redirect_to post_path(@post)
      else
        flash[:error] = @comment.errors.full_messages.join(", ")
        render :new
      end
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :name, :email)
    end
end
