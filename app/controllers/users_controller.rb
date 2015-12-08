class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to(root_url)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if current_user.authenticate(params[:user][:current_password])
      if @user.update_attributes(user_params)
        flash[:success] = "Success!"
        redirect_to edit_user_path(current_user)
      else
        render 'edit'
      end
    else
      flash[:warning] = "Please enter your current password."
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,
              :password, :password_confirmation)
  end

  # --- before filters ---

  # confirms a logged-in user
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url 
    end
  end

  # confirms the correct user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
