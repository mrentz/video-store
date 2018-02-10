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
    puts @video.theme
  end
  
  it "must have a unique title" do
    video2 = Video.new
    video2.title = @video.title
    expect(video2).not_to be_valid
  end

  describe ".search" do
    
    video1 = FactoryBot.create(:video)
    video1.title = "title1"
    video1.actors = "actor1"
    video1.save
    video2 = Video.create(title: "title2", actors: "actor2")
    video3 = Video.create(title: "title3", actors: "actor3")
    video4 = Video.create(title: "title4", actors: "actor4")
    video5 = Video.create(title: "title5", actors: "actor5")
    video6 = Video.create(title: "title6", actors: "actor6")
    
    it "should return full list upon nil search fields" do
      videos = Video.search(nil, [:theme, :actors])
      expect(videos).to match_array(Video.all)
    end

    it "should return videos by title when no fields checked" do
      i = rand(1..6)
      videos = Video.search("title#{i}", [])
      expect(videos).to match_array(Video.find_by title: "title#{i}")
    end
    
    end
  
  end
