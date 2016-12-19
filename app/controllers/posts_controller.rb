class PostsController < ApplicationController
  before_action :require_login
  def index
    @user = User.find(session[:user_id])
    post = Post.includes(:user)
    @post = post.sort {|a,b| b.likes.count <=> a.likes.count}
  end

  def create
    form = params[:post]
    user = User.find(session[:user_id])
    post = Post.new(post_params)
    post.user = user
    if post.save
      flash[:msg] = "Successfully made an idea!"
    else
      flash[:msg] = post.errors.full_messages
    end
    redirect_to :back
  end

  def show
    id = params[:id]
    @post = Post.find(id)
    @likers = Like.where(post:id)
  end

  def destroy
    id = params[:id]
    post = Post.find(id)
    post.destroy if post.user == current_user
    redirect_to :back
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
