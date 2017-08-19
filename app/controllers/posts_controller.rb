class PostsController < ApplicationController
before_action :authenticate_user!, only: [
                                             :new,
                                             :create,
                                             :edit,
                                             :update,
                                             :destroy
                                           ]

before_action :check_permissions, only: [:edit, :update, :destroy]

  def index
      @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)


    if @post.save
      flash[:success] = 'Пост опубликован'
     redirect_to post_path(@post)
    else
      flash[:alert] = 'Извините, возникла ошибка'
      render 'posts/new'
    end
  end

  def edit
  @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = 'Пост сохранён'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Problems updating post'
      @errors = @post.errors.full_messages
      render 'posts/edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Пост успешно удалён'
      redirect_to posts_path
    else
      flash[:alert] = 'Возникла ошибка, попробуйте еще раз'
      redirect_to post_path(@post)
    end
  end


  private

    def post_params
      params.require(:post).permit(:title,
                                   :content)

    end
end
