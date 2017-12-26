#***spec/models/video_spec.rb***

require 'rails_helper'

describe Video do

  it "has a valid factory" do
    FactoryBot.create(:video).should be_valid
end
  
end
