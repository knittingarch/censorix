class CategoriesController < ApplicationController
  def index
    categories = Category.all

    render locals: {categories: categories}
  end

  def show
    if params[:id].present?
      category = Category.find(params[:id])
    end

    posts = category.posts

    render locals: {
      category: category,
      posts: posts
    }
  end
end
