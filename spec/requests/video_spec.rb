require 'rails_helper'

describe "Visiting the video index page" do

  before { visit videos_path }

  subject { page }
  
  it { is_expected.to have_selector('h1', :text => 'Matthews List of Videos') }

  it 'should link to add new video page' do
    click_link 'Add New Video'
    expect(page).to have_selector('h2', :text => 'Add a New Video')
    fill_in 'title', with: 'Content'
    click_button "Add To List"
  end

  it 'should render new video detailed view' do

  end

end
