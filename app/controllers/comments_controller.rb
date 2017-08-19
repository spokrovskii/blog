class CommentsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show, :new, :create]

before_action :check_permissions, only: [:edit, :update, :destroy]
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.commments.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
      if @comment.save
        flash[:notice] = "Комментарий успешно добавлен"
        redirect_to post_path(@post)
      else
        flash[:error] = @comment.errors.full_messages.join(", ")
        render :new
      end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash[:success] = 'Комментарий успешно обнавлён'
      redirect_to venue_path(@comment.venue)
    else
      flash[:alert] = 'Проблема при сохранении'
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    flash[:success] = 'Коментарий удалён'
    redirect_to venue_path(@comment.venue_id)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :name, :email)
    end
end
