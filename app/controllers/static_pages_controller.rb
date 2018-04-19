require 'get_top_5'
require 'stars'
require 'tick'

class StaticPagesController < ApplicationController
  
before_action :authenticate_user!, except: [:home, :contact, :about, :help]

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
