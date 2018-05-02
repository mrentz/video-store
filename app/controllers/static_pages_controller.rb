require 'get_top_5'
require 'stars'
require 'tick'
# rdoc comment here
class StaticPagesController < ApplicationController

before_action :authenticate_user!, except: [:home, :contact, :about, :help]

## rdoc for all of these when you're not using CRUD actions
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
