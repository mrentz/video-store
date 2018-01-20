require 'rails_helper'

describe "Visiting the video index page" do

  before { visit videos_path }

  subject { page }
  
  it { is_expected.to have_selector('h1', :text => 'Matthews List of Videos') }

  it 'should search and save movies' do
    expect(page).to have_selector('h2', :text => 'Search All Movies')
    fill_in 'title', with: 'Content'
    click_button "Search"
    expect(page).to have_content "Content"
    click_button "Save"
    expect(page).to have_content "Content"
    expect(page).to have_selector('h1', :text => 'Matthews List of Videos') 
    expect(page).to have_selector('h2', :text => 'Search All Movies')
    fill_in 'title', with: 'Content'
    click_button "Search"
    expect(page).to have_content "Content"
    expect(page).to have_selector('h1', :text => 'Matthews Video Store') 
    expect(page).to have_css('a[data-confirm="Do you really want to delete this video?"]')
    click_link "Delete"
  end


end
