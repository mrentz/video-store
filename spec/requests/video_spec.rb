require 'rails_helper'

describe "Visiting the video index page" do

  before { visit videos_path }

  subject { page }
  
  it { is_expected.to have_selector('h1', :text => 'Matthews List of Videos') }

  it 'should search movies' do
    expect(page).to have_selector('h2', :text => 'Search All Movies')
    fill_in 'title', with: 'Content'
    click_button "Search"
  end

  it 'should render new video detailed view' do

  end

end
