class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Zarejestrowano!"
    else
      flash[:alert] = []
      @user.errors.values.flatten.each do |message|
        flash[:alert] << message    
      end
      redirect_to sign_up_path # @user.errors.values.flatten #render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
