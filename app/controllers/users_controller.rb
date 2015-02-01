class UsersController < ApplicationController

  helper_method :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Zarejestrowano!"
    else
      flash[:alert] = []
      @user.errors.values.flatten.each do |message|
        flash[:alert] << message    
      end
      redirect_to sign_up_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    session[:user_id] = nil
    user.destroy
    redirect_to root_path
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to user_path(user[:id])
    else
      render 'edit'
    end

  end

  def require_login
      if current_user
        redirect_to user_path(current_user[:id])
      else
        flash[:alert] = "Musisz być zalogowany!"
        redirect_to root_path
      end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
