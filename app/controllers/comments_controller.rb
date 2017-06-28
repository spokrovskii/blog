class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  def show
    @post = Post.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
      if @comment.save
        flash[:notice] = "Comment added successfully"
        redirect_to post_path(@post)
      else
        flash[:error] = @comment.errors.full_messages.join(", ")
        render :new
      end
  end

  private
    def post_params
      params.require(:post).permit(:title,
                                   :content)

    end

    def comment_params
      params.require(:comment).permit(:content, :name, :email)
    end
end
