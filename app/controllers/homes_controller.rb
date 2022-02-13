class HomesController < ApplicationController

  def top
    @posts = Post.all
    @categories = Category.all
  end

  def about
  end

end
