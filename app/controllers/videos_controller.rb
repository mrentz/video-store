require 'api'

class VideosController < ApplicationController
  def index
    @videos = Top5.movieData
  end
end
