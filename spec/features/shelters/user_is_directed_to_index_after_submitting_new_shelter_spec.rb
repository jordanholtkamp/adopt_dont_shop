require 'rails_helper'

describe 'shelter new page', type: :feature do
  it "can submit and go back to index page" do

    visit 'shelters/new'

    fill_in 'name', with: 'Boulder Shelter'
    fill_in 'address', with: '456 Pearl Street'
    fill_in 'city', with: 'Boulder'
    fill_in 'state', with: 'CO'
    fill_in 'zip', with: 80304

    click_button 'Submit'

    expect(current_path).to eq("/shelters")
    expect(page).to have_content("Boulder Shelter")
  end
end