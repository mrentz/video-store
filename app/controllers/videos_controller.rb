require 'video_data.rb'
require 'stars'

class VideosController < ApplicationController

  def movie_already_saved?
    Video.find_by(title: params[:title])
  end

  def new

  end
  
  def index
    @videos = Video.all
  end

  def create
    if movie_already_saved?
    render :show
    else
    @movie = movieData(params[:title])    
      if @movie[:thumbnail] == "N/A"
#        @movie[:thumbnail] = "assets/images/noimage.png"
      end
    render :details
    end
  end

#    @movie = Video.new movieData(params[:title])
#    if @movie.save
#      flash[:notice] = "#{@movie.title} saved."
#      render :details
#    #      redirect_to @movie
#    else
#      render :new
#    end
#  end
  
  def show
    @movie = Video.find(params[:id])
  end

  def details

  end
  
end
