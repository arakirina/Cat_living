class PostsController < ApplicationController

  def new
    @post = Post.new
    @category = Category.all.map{ |category| [category.name, category.id,] }
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def index
    if params[:category_id].present?
     @category = Category.find(params[:category_id])
     @posts = Post.where(category_id: params[:category_id]).page(params[:page]).reverse_order
     pp @posts
    else
     @posts = Post.page(params[:page]).reverse_order
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    if @post.category_id.present?
     @category = Category.find(@post.category_id)
    end
  end

  def edit
    @post = Post.find(params[:id])
    @category = Category.all.map{ |category| [category.name, category.id,] }
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.where('body LIKE ?', "%#{params[:name]}%").or(Post.where('title LIKE ?', "%#{params[:name]}%"))
    @is_search = true
    render :index
  end

  private

  def post_params
    params.require(:post).permit(:title,:body,:category_id, post_images_images: [])
  end

end
