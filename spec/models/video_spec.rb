#***spec/models/video_spec.rb***

require 'rails_helper'

describe Video do

  before(:each) do
    @video = FactoryBot.create(:video)
  end
  
  it "has a valid factory" do
    expect(@video).to be_valid
end
  
end
