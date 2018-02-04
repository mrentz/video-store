require 'rails_helper'

describe "Visiting the video index page" do

  before { visit videos_path }

  subject { page }
  
  it { is_expected.to have_selector('h1', :text => 'Matthews List of Videos') }

  it 'should search and save and delete movies' do
    expect(page).to have_selector('h2', :text => 'Search All Movies')
    fill_in 'title', with: 'Content'
    click_button "web_search"
    expect(page).to have_content "Content"
    click_button "Save"
    expect(page).to have_content "Content"
    expect(page).to have_selector('h1', :text => 'Matthews List of Videos') 
    expect(page).to have_selector('h2', :text => 'Search All Movies')
    expect(page).to have_selector('div.alert.alert-success')
    fill_in 'title', with: 'Content'
    click_button "web_search"
    expect(page).to have_content "Content"
    expect(page).to have_selector('h1', :text => 'Matthews Video Store') 
    expect(page).to have_css('a[data-confirm="Do you really want to delete this video?"]')
    click_link "Delete"
end
  
  it 'should confirm before delete' do
  end
  
  it 'has working flash messages' do
  end
    
  it "should have local site title keyphrase search",
     :type => :feature,
     :driver => :webkit,
     :js => true do
    fill_in 'title', with: 'Content'
    click_button "web_search"
    expect(page).to have_content "CONTENT"
    page.find('input[value="Save"]').trigger("click") #workaround Webkit BUG!!
#    click_button "Save"
    click_link "Home"
    fill_in "Keyword Search", with: "Conte"
    click_button "Site Search"
    expect(page).to have_content "Content"
    expect(page).to have_selector('h1', :text => 'Matthews List of Videos') 
    expect(page).to have_selector('h2', :text => 'Search All Movies')
    click_link "Content"
    expect(page).to have_css('a[data-confirm="Do you really want to delete this video?"]')
    page.accept_confirm do
      click_link "Delete"
    end
    expect(page).to have_selector('h1', :text => 'Matthews List of Videos') 
    expect(page).to have_selector('h2', :text => 'Search All Movies')
  end

  it "site search should filter for actors" do
  end

  it "site search should filter for theme" do
  end

  it "site search should filter for both actors and theme" do
  end

end
