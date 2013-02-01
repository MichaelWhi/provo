class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(project_params)
    if @user_session.save
      redirect_back_or_default root_path, notice: "Login successful!"
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    redirect_back_or_default root_path, notice: "Logout successful!"
  end
  
  protected
  def project_params
    params.require(:user_session).permit(:email, :password)
  end
end