class CommentsController < ApplicationController
  before_filter :authenticate, :only => [:new, :create]

  def index
    @comments = Comment.all
  end
  def show
    @comment = Comment.find(params[:id])
    
  end
  def new
    snippet = Snippet.find(params[:snippet_id])
    @comment = snippet.comments.new
  end
  def create
    @comment = current_user.comments.new(params[:comment])
    if @comment.save
      redirect_to profile_path(current_user.profile)
    else
      render :new
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    redirect_to profile_path(current_user.profile)
  end

  def destroy

    comment = Comment.find(params[:id])
    authorize! :destroy, comment
    comment.destroy
    redirect_to profile_path(current_user.profile)
  end
end
