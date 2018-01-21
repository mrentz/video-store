require 'video_data.rb'
require 'stars'

class VideosController < ApplicationController

  def saved(title_search)
    @movie = Video.where("title ~* ?", "#{title_search}").first
  end

  def saved_locally(title_search)
    @movie = Video.find_by(title: "#{title_search}")
  end
  
  def new
    
  end
  
  def index
    if params[:commit] == "site search"
      local_movies = saved(params[:search_string])
      if local_movies.blank? == true
        flash[:notice] = "Nothing relating to #{params[:search_string]} can be found."
        redirect_to :action => 'index'
      end
      @videos = Video.where('title ~* ?',
                            "#{params[:search_string]}").paginate(page: params[:page],
                                                                  per_page: 5)
      puts ">>>>>"
 puts ">>>>>>>>>>>>>>> #{params[:search_string]}"
      else
      @videos = Video.all.paginate(page: params[:page], per_page: 5)
    end
  end
  
  def create
    @movie = saved_locally(params[:title])
    if @movie.blank? == true && params[:commit] == "Search"
      @movie = movieData(params[:title])    
      render :details
    elsif params[:commit] == "Save"
      @movie = Video.new movieData(params[:title])
      if @movie.save
        flash[:notice] = "#{@movie.title} saved."
        redirect_to videos_path(@movie)
      end
    else
      redirect_to video_path(@movie)
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
  
