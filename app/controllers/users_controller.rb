class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  def index
    @users = User.all.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
  end

  private
  def user_params
    params.require :user.permit :email, :password, :password_confirmation, :role
  end

  def logged_in_user
    unless !current_user.nil?
      redirect_to new_user_session_path
    end
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless @user == current_user
  end
end
