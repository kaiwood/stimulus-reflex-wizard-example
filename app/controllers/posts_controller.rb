class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post ||= Post.persistant(session.id)
    @step ||= Rails.cache.fetch("step:#{session.id}") { :title }
  end

  def create
    @post = Post.create(post_params)
    Post.clear_cache(session.id)

    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  protected

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
