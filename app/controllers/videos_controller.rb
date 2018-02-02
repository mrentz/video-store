require 'video_data.rb'
require 'stars'
require 'tick'

class VideosController < ApplicationController

  def new
    
  end
  
  def index
    case params[:commit]
    when "site search"
      @videos =  site_search_result(params).paginate(page: params[:page],
                                       per_page: 5)
      if @videos.blank? == true
        flash[:warning] = "Nothing relating to #{params[:search_string]} can be found."
        redirect_to :action => 'index'
      end
    when "Web Search"
      title = movieData(params[:title])    
      if title[:title] == "false"
        flash[:danger] = "The film #{params[:title]} does not exists on the internet"
        redirect_to :action => 'index'
      else
        @movie = saved_locally(title[:title])
        if @movie.blank? == true
          @movie = title
          render :details
        else
        redirect_to video_path(@movie.id)
        end
      end
    else
      @videos = Video.all.paginate(page: params[:page], per_page: 5)
    end
  end
  
  def create
    @movie = Video.new movieData(params[:title])
    if @movie.save
      flash[:success] = "#{@movie.title} saved."
      redirect_to videos_path(@movie)
    else
      flash[:info] = "#{@movie.title} already seems to exist on our system" 
      redirect_to videos_path(@movie)
    end
  end
  
  def show
    @movie = Video.find(params[:id])
  end
  
  def destroy
    video = Video.find(params[:id])
    video.destroy
    flash[:info] = "#{video.title} deleted."
    redirect_to :action => 'index'
  end
  
  def details
    
  end

  private
  
  def saved_locally(title_search)
    @movie = Video.where('title = ?', "#{title_search.titleize}").first
  end

  def site_search_result(params)
    unless params[:search_string].blank?
      results = []
      context_search = false
      params.each do |key, value|
        if value == "true"
          context_search = true
          key_type = Video.where("#{key} ~* ?",
                               "#{params[:search_string]}")
          if key_type
            results << key_type
          end   
        end
      end
      if context_search
        search_result = results.pop
        results.each do |result|
          search_result = search_result.or(result)
        end
        videos = search_result
      else
        videos = Video.where("title ~* ?",
                             "#{params[:search_string]}")
      end
    else
      videos = Video.all
    end
    return videos
  end
end
