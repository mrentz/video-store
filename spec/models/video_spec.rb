# == Schema Information
#
# Table name: videos
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :string
#  content_rating :string
#  rating         :integer
#  actors         :string
#  thumbnail      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  theme          :text
#  stars          :string
#  release_date   :string
#  user_id        :integer
#

#***spec/models/video_spec.rb***
require 'rails_helper'

describe Video do

  before(:each) do
    @video = FactoryBot.create(:video)
    video2 = Video.create(title: "title2", actors: "actor2", theme: "theme2", description: Faker::Lorem.sentence)
    video3 = Video.create(title: "title3", actors: "actor3", theme: "theme3", description: Faker::Lorem.sentence)
    video4 = Video.create(title: "title4", actors: "actor4", theme: "theme4", description: Faker::Lorem.sentence)
    video5 = Video.create(title: "title5", actors: "actor5", theme: "theme5", description: Faker::Lorem.sentence)
    video6 = Video.create(title: "title6", actors: "actor6", theme: "theme6", description: Faker::Lorem.sentence)
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

  describe ".custom_search" do
    before(:each) do
      
      video1 = FactoryBot.create(:video)
      video1.title = "title1"
      video1.actors = "actor1"
      video1.theme = "horror"
      video1.save
      i=2
      videos=[video1]
      
      5.times do
        videos[i] = Video.create(title: "title#{i}",
                                 actors: "actor#{i}",
                                 theme: "theme#{i}",
                                 thumbnail: "noimage.png",
                                 description: Faker::Lorem.sentence)
        i+=1
      end
    end
    
    random = rand(1..6)
    
    
    it "should return full list upon nil search text" do
      videos = Video.custom_search(nil, [:theme, :actors])
      expect(videos).to match_array(Video.all)
    end
    
    it "should return videos by title when no fields checked" do
      videos = Video.custom_search("title#{random}", [])
      expect(videos).to match_array(Video.find_by title: "title#{random}")
    end
    
    it "returns searched videos" do
      videos = Video.custom_search("title", [:title, :actors, :theme])
      expect(videos.size).to eq(6)
    end
    
    it "returns searched videos by multiple fields" do
      videos = Video.custom_search("#{random}", [:title])
      expect(videos.size).to eq(1)
      videos = Video.custom_search("#{random}", [:actors, :theme])
      expect(videos.size).to eq(1)
      videos = Video.custom_search("horror", [:theme])
      expect(videos.size).to eq(1)
    end
    
  end
  
end

