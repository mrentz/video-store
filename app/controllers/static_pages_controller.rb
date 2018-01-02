require 'api'

class StaticPagesController < ApplicationController
  def home
    @top5videos = Top5.movieData
  end

  def help
  end

  def about
  end

  def contact
  end

  def index
  end

end
