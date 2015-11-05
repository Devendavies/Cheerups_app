class CheerupController < ApplicationController

  before_action :authorize, except: [:index]

  def index
    @cheerups = Cheerup.all
  end

  def new
    @cheerup = Cheerup.new

    id = session[:user_id]
    @user = User.find_by(id)
  end

  def create
    cheerup = Cheerup.create(cheerup_params)
    cheerup.user_id = current_user.id
    if cheerup.save
      redirect_to 'cheerups'
    else
      redirect_to 'cheerups/new'
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
    cheerup[:user_id] = nil
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
