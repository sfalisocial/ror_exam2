class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  def create
    form = params[:user]
    if form[:password] == form[:password_confirmation]
      user = User.new(user_params)
      if user.save
        flash[:msg] = 'Successfully regsitered!'
      else
        flash[:msg] = user.errors.full_messages
      end
    end
    redirect_to '/'
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end
end
