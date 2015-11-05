class UsersController < ApplicationController

  before_filter :authorize, except: [:index, :new , :create]

  # Admin Only User Listing
  def index
    @users = User.all
    @current_user = User.find_by_id(session[:current_user_id])
  end

  # New User Obj
  def new
    @user = User.new
  end

  # User Signup
  def create
    user = User.new(user_params)
    if user.save
      redirect_to('/cheerups')
    else
      redirect_to('users/new')
    end
  end

  # User Profile
  def show
    @user = User.find(params[:id])
  end

  private
  # User information fetch for batabase
  def user_params
    params.require(:user).permit(
      :image_url,
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
