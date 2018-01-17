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
    elsif params[:commit] == "Search"
      @movie = movieData(params[:title])    
      if @movie[:thumbnail] == "N/A"
        @movie[:thumbnail] = "noimage"
      end
      render :details
    elsif params[:commit] == "Save"
      @movie = Video.new movieData(params[:title])
      if @movie.save
        flash[:notice] = "#{@movie.title} saved."
        redirect_to videos_path
      end
    end
  end

   def destroy
     video = Video.find(params[:id])
     video.destroy
     flash[:notice] = "#{video.title} deleted."
     redirect_to :action => 'index'
   end
  
  def show
    @movie = Video.find(params[:id])
  end
  
  def details

  end
end
  
