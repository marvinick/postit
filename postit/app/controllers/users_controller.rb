 class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You are registered"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(slug: params[:id])
  end

  # def update
   # if @user.update(user_params)
    #  flash[:notice] = "This user was updated"
     # redirect_to root_path
    #else
     # render :edit
    #end
  # end

  private

  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end
end