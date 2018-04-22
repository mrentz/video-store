require 'video_data.rb'
require 'stars'
require 'tick'

class VideosController < ApplicationController

before_action :authenticate_user!, except: [:index, :home, :show, :destroy]
  
  def new
  end
  
  def index

    case params[:commit]
    when "site_search"
      @videos =  local_search(params).paginate(page: params[:page],
                                       per_page: 5) 
     if @videos.blank?
        flash[:warning] = "Nothing relating to #{params[:search_string]} can be found on this database."
        redirect_to :action => 'index'
      end
    when "web_search"
      title = movie_data(params[:title])    
      if title[:title] == "false"
        flash[:danger] = "The film #{params[:title]} does not exists on the internet"
        redirect_to :action => 'index'
      else
        @movie = get_video(title[:title])
        if @movie.blank?
          @movie = title
          @user_id = 3
          render :details
        else
        redirect_to video_path(@movie)
        end
      end
    else
      @videos = Video.all.paginate(page: params[:page], per_page: 5)
    end
  end
  
  def create

    @movie = Video.new movie_data(params[:title])
    @movie.user_id = current_user.id

    if @movie.save
      flash[:success] = "#{@movie.title} saved."
      redirect_to videos_path(@movie)
    else
      flash[:info] = "#{@movie.title} doesn't seem to want to save on our system" 
      redirect_to videos_path(@movie)
    end
  end
  
  def show
    @movie = Video.find(params[:id])
    @suggestions = []
    Video.suggestions(@movie).each do |suggestion|
      @suggestions.push(Video.find_by(title: suggestion.title))
    end
  end
  
  def destroy
    video = Video.find(params[:id])
    video.destroy
    flash[:info] = "#{video.title} deleted."
    redirect_to :action => 'index'
  end
  
  private
  
  def get_video(title)
    Video.find_by(title: title.titleize)
  end

  def local_search(params)
    search_fields = []
     params.each do |key, value|
        if value == "true"
          search_fields << key
        end
     end
     videos = Video.custom_search(params[:search_string], search_fields)
   end

end
