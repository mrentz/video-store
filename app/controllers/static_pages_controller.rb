require 'get_top_5'
require 'stars'

class StaticPagesController < ApplicationController
  def home
    @top5videos = Top5.data
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
