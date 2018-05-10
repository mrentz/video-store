require 'get_top_5'
require 'stars'
require 'tick'
# rdoc comment here
class StaticPagesController < ApplicationController

before_action :authenticate_user!, except: [:home, :contact, :about, :help]

  ##
  # Home page displays list of top 5 new releases
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
