class SnippetsController < ApplicationController
  before_filter :authenticate, :only => [:new, :create]

  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end
  
  def create
    song = Song.create(title: params[:song][:title], file: params[:song][:file])
    @snippet = current_user.snippets.new(params[:snippet])
    @snippet.song = song
    if @snippet.save
      flash[:notice] = "Created Snippet"
      redirect_to @snippet
    else
      flash[:notice] = "An error occured"
      render :new
    end
  end
  
  def edit
    @snippet = Snippet.find(params[:id])
    authorize! :edit, @snippet
  end

  def update

    snippet = Snippet.find(params[:id])
    authorize! :update, @snippet 
    snippet.update_attributes(params[:snippet])
    redirect_to @snippet
  end

  def destroy
    snippet = Snippet.find(params[:id])
    authorize! :destroy, @snippet 
    snippet.delete
    redirect_to root_path
  end


end