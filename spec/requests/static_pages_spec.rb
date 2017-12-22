require 'spec_helper'
require 'rails_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Home'" do
      visit '/'
      page.should have_content('Home')
    end
  end
end
