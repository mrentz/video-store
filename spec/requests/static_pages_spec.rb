#require 'spec_helper'
require 'rails_helper'

describe "Static pages" do

  def confirm(html_tag)
      expect(page).to have_selector(html_tag)
  end
  
  let(:base_title) { "Matthews Video Store Sample App" }
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    it { is_expected.to have_selector('h1', :text => 'Home') }
    it { is_expected.to have_selector('title',
                                      :text => base_title) }

    it "should have the h1 'Home'" do
            expect(page).to have_selector('h1', :text => 'Home')
    end
    
    it "should have the title 'Home'" do
      visit '/'
      expect(page).to have_selector('title',
                                    :text => base_title)
    end
    
    it "Homepage should contain all of the following tags" do
      visit '/'
      confirm('body')
      confirm('title')
      confirm('html')
      confirm('p')
      confirm('li')
      confirm('ul')
      confirm('nav')
    end

    it "should have the h1 'Help'" do
      visit '/help'
      expect(page).to have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/help'
      expect(page).to have_selector('title', :text => "#{base_title} | Help")
    end
    
    it "should have the h1 'About'" do
      visit '/about'
      expect(page).to have_selector('h1', :text => 'About')
    end

    it "Homepage should have the content 'Help'" do
      visit '/'
      expect(page).to have_content('Help')
    end
  end

  describe "About page" do

    it "Homepage should have the content 'About'" do
      visit '/'
      expect(page).to have_content('About')
    end
  end

  describe "Contact page" do

    it "Homepage should have the content 'Contact'" do
      visit '/'
      expect(page).to have_content('Contact')
    end
  end

  describe "Video page" do

    it "Homepage should have the content 'Video'" do
      visit '/'
      expect(page).to have_content('Videos')
      click_link "Video"
      expect(page).to have_selector('title', :text => base_title)
    end
  end
end
