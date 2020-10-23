class HomeController < ApplicationController
  def index
    categories = Category.all
    post = Post.order("updated_at").where(featured: true).last

    render locals: {
      post: post,
      categories: categories
    }
  end
end
