class HomeController < ApplicationController
  def index
    categories = Category.all
    post = Post.most_recent_featured_post

    render locals: {
      post: post,
      categories: categories
    }
  end
end
