#***spec/models/video_spec.rb***

require 'rails_helper'

describe Video do

  before(:each) do
    @video = FactoryBot.create(:video)
  end
  
  it "has a valid factory" do
    expect(@video).to be_valid
    puts @video.title
    puts @video.description
    puts @video.actors
    puts @video.thumbnail
  end
  
end
