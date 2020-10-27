class PostsController < ApplicationController
  def show
    post = Post.find(params[:id])

    render locals: {
      post: post
    }
  end
end
