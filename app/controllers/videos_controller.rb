require 'video_data.rb'

class VideosController < ApplicationController

  def new
    @video = Video.new
  end
  
  def index
    @videos = Video.all
  end

  def create
    title = params[:title]
    video = movieData(params[:imdbid])
    puts params[:title]
    puts video
    #  @video = Video.new params[:video]
    #    if @video.save
    #      flash[:notice] = "#{@video.title} saved."
    #      redirect_to @video
    #    else
    render :new
    #    end
  end
  
  def show
    
  end
  
end
