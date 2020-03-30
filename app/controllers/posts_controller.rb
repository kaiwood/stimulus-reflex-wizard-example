class PostsController < ApplicationController
  def index
  end

  def new
    @post ||= Post.persistant(session.id)
    @step ||= Rails.cache.fetch("step:#{session.id}") { :title }
  end
end
