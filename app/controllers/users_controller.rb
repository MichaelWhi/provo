class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_back_or_default projects_path, notice: "Account registered!"
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(user_params)
      redirect_to root_path, notice: "Account updated!"
    else
      render :action => :edit
    end
  end
  
  protected
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :twitter)
  end
end