require 'get_top_5'
require 'rails_helper'

describe "Visting as a non signed-in user", :type => :feature do
  
  before(:each) do
    Video.__elasticsearch__.delete_index!

    5.times do
      FactoryBot.create(:video)
    end

    Video.__elasticsearch__.refresh_index!
  end
    
  before { visit root_path }
  
  subject { page }
  
let(:user) { FactoryBot.create(:user) }

  describe "Home page" do

    it { is_expected.to have_selector('h1', :text => 'Matthews Video Store') }

    it "should have the signup button" do
      expect(page).to have_content('Sign up now!')
      click_link Top5.data.first[:title]
      expect(page).to have_content('Sign up now!')
      expect(page).to have_content(Video.first.title)
      expect(page).to have_link(Video.first.title)
      click_link Video.first[:title]
      expect(page).to have_content('Sign up now!')
      expect(page).to have_content('add to cart')
      click_link('add to cart')
      expect(page).to have_content('Sign up now!')
    end
    
  end
  
  
  
end
