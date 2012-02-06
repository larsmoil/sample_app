class UsersController < ApplicationController
  respond_to :html, :json

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      respond_with(@user)
    else
      render 'new'
    end
  end

  def show
    respond_with(@user = User.find(params[:id]))
  end
end
