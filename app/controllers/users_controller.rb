class UsersController < ApplicationController
  before_filter :only_one_user
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def only_one_user
    redirect_to :root if User.count > 0
  end
end
