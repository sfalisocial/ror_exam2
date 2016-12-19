class LikesController < ApplicationController
  before_action :require_login
  def create
    user = User.find(session[:user_id])
    post = Post.find(params[:id])
    Like.create(user:user, post:post)
    redirect_to :back
  end

  def destroy
    id = params[:id]
    like = Like.find_by(post:id)
    like.destroy if like.user_id == current_user
    puts '*******'
    puts like.user_id
    puts '******'
    redirect_to :back
  end
end
