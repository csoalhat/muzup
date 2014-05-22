class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    authorize! :show, @user
  end

  # Signup
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_profile_index_path, :notice => "You have succesfully signed up!"
    else
      render :new
    end
  end

end
