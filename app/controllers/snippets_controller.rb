class SnippetsController < ApplicationController
  before_filter :authenticate, :only => [:new, :create]

def perform_search
    page = params[:page].try(:to_i) || 1
    per_page = params[:per_page].try(:to_i) || 5 

    @q = Snippet.search(params[:q])
    @snippets = @q.result(distinct: true).page(page).per_page(per_page)
  end


  def index
    perform_search
  end

  def search 
    index
    render :index 
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
      redirect_to profile_path(current_user.profile)
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
    redirect_to profile_path(current_user.profile)
  end

  def destroy
    snippet = Snippet.find(params[:id])
    authorize! :destroy, snippet 
    snippet.delete
    redirect_to profile_path(current_user.profile)
  end

end