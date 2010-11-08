class UsersController < ApplicationController
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_back_or_default :root
    else
      render :action => :new
    end
  end
end