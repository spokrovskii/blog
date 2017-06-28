class PostsController < ApplicationController

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
     redirect_to @post
    else
      flash[:alert] = 'Извините, возникла ошибка, свяжитесь с разроботчиком блога'
      render 'posts/new'
    end
  end



  private

    def post_params
      params.require(:post).permit(:title,
                                   :content)

    end

end
