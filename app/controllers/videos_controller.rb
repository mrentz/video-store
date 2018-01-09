
class VideosController < ApplicationController

  def new
    @video = Video.new
  end
  
  def index
    @videos = Video.all
  end

  def new
#    @video = Video.new
  end

  def create
  title = params[:title]
  imdbid = params[:imbdid]
    @video = Video.new params[:video]
    if @video.save
      flash[:notice] = "#{@video.title} saved."
      redirect_to @video
    else
      render :new
    end
  end
  
  def show
    
  end
  
end
