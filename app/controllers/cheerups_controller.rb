class CheerupsController < ApplicationController

  before_action :authorize, except: [:index]

  def index
    @cheerups = Cheerup.all
  end

  def new
    @cheerup = Cheerup.new

    @user = User.find(session[:user_id])
  end

  def create
    cheerup = Cheerup.new(cheerup_params)
    cheerup.user_id = current_user.id
    if cheerup.save
      redirect_to '/cheerups/index'
    else
      redirect_to '/cheerups/new'
    end
  end

  def edit
    @cheerup = Cheerup.find(params[:id])
  end

  def update
    cheerup = Cheerup.find(params[:id])

    if cheerup.update(cheerup_params)
      redirect_to '/cheerups'
    else
      redirect_to '/cheerups/edit'
    end

  end

  def destroy
    cheerup = Cheerup.find(params[:id])
    cheerup.delete
    redirect_to('/cheerups')
  end

  def show
    id = current_user.id
    @cheerup = Cheerup.find(id)
    @user = @current_user
    @comments = @cheerup.comments.all
    @comment = @cheerup.comments.build

    redirect_to('/cheerups')
  end

  private

  def cheerup_params
    params.require(:cheerup).permit(
      :title,
      :content
    )
  end
end
