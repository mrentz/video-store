require 'video_data.rb'
require 'stars'

class VideosController < ApplicationController

  def new
#    @video = Video.new
  end
  
  def index
    @videos = Video.all
  end

  def create
    @movie = Video.new movieData(params[:title])
    if @movie.save
      flash[:notice] = "#{@movie.title} saved."
      render :details
    #      redirect_to @movie
    else
      render :new
    end
  end
  
  def show
    @movie = Video.find(params[:id])
  end

  def details
    
  end
  
end
