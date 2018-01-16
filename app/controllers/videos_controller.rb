require 'video_data.rb'
require 'stars'

class VideosController < ApplicationController

  def new

  end
  
  def index
    @videos = Video.all
  end

  def create
    @movie = movieData(params[:title])    
    if Video.find_by(title: params[:title])
    render :show
    else
    render :details
    end
#    @movie = Video.new movieData(params[:title])
#    if @movie.save
#      flash[:notice] = "#{@movie.title} saved."
#      render :details
#    #      redirect_to @movie
#    else
#      render :new
#    end
  end
  
  def show
    @movie = Video.find(params[:id])
  end

  def details

  end
  
end
