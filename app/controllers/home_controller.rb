class HomeController < ApplicationController
  def index
    post = Post.order("updated_at").where(featured: true).last

    render locals: {
      post: post
    }
  end
end
