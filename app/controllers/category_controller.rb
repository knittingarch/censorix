class CategoryController < ApplicationController
  def index
    categories = Category.all

    render locals: {categories: categories}
  end

  def show
    if params[:id].present?
      category = Category.find(params[:id])
      posts = category.posts
    else
      posts = nil
    end

    render locals: {
      category: category,
      posts: posts
    }
  end
end
