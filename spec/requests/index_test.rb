require 'rails_helper'

describe "Visiting the video index page" do

  before(:each) do
    Video.__elasticsearch__.delete_index!
    5.times do
      @video = FactoryBot.create(:video)
      @video.save
    end
  end
  
  Video.__elasticsearch__.refresh_index!

  before { visit videos_path }

  subject { page }
  
  it { is_expected.to have_selector('h1', :text => 'Matthews List of Videos') }

  it 'should enable users to search, save and/or delete movies', elasticsearch: true, :type => :model do
    expect(page).to have_selector('h2', :text => 'Search All Movies')
    fill_in 'title', with: 'Content'
    click_button "web_search"
    expect(page).to have_content "Content"
    click_button "Save"
    expect(page).to have_content "Content"
    expect(page).to have_selector 'h1', :text => 'Matthews List of Videos' 
    expect(page).to have_selector('h2', :text => 'Search All Movies')
    expect(page).to have_selector('div.alert.alert-success')
    ref = "/videos/#{Video.last.id}"
    click_link "2"
    page.assert_selector(:link, Video.last.title, href: "#{ref}")
    puts Video.last.thumbnail
  end
  

end
