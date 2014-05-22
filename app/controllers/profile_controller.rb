class ProfileController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :edit]

  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.profile.new(params[:profile])
    if @profile.save
      redirect_to(@profile)
    else
      render :new
    end
  end
  
  def edit
    @profile = current_user.profile
    redirect_to root_path, alert: "no corresponding profile" if @profile.nil?
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update_attributes(params[:profile])
    redirect_to(@profile)
  end

  def destroy

    @profile = Profile.find(params[:id])
    authorize! :destroy, profile
    profile.destroy
    redirect_to(index_path)
  end
end
