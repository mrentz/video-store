require 'video_data.rb'
require 'stars'

class VideosController < ApplicationController

  def new
#    @video = Video.new
  end
  
  def index
#    @videos = Video.all
  end

  def create
    @movie = Video.new movieData(params[:title])
    #  @video = Video.new params[:video]
    #    if @video.save
    #      flash[:notice] = "#{@video.title} saved."
    #      redirect_to @video
    #    else
    render :details
    #    end
  end
  
  def show
    
  end

  def details
    
  end
  
end
