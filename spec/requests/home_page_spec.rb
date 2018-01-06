require 'rails_helper'

describe "Visiting the public landing page" do

  before { visit root_path }

  subject { page }
  
  def confirm_5(tag, div_class)
    expect(page).to have_selector(tag, :class => div_class, :count => 5)
  end

  it { is_expected.to have_selector('h1', :text => 'Matthews Video Store') }

  it 'should list details for top 5 videos' do
    expect(page).to have_selector('div', :class => 'stars', :count => 5)
    confirm_5('div',  'stars')
    confirm_5('span', 'review-no')
    confirm_5('div',  'details')
    confirm_5('div',  'preview-pic')
  end

  it 'should be rendering Fontawsome fonts' do

  end

end
