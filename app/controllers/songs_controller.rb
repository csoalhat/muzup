class SongsController < ApplicationController
    before_filter :authenticate, :only => [:new, :create]

  def index
    @songs = Song.all
  end
  def show
    @song = Song.find(params[:id])
    
  end
  def new
    @song = Song.new
  end
  def create
    @song = current_user.songs.new(params[:song])
    if @song.save
      redirect_to root_url
    else
      render :new
    end
  end
  
  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(params[:song])
    redirect_to root_url
  end

  def destroy

    song = Song.find(params[:id])
    authorize! :destroy, song
    song.destroy
    redirect_to(@profile)
  end
end
