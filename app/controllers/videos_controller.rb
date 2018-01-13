require 'video_data.rb'

class VideosController < ApplicationController

  def new
#    @video = Video.new
  end
  
  def index
#    @videos = Video.all
  end

  def create
    @movie = movieData(params[:title])
    puts @movie
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
