require 'rails_helper'

describe "shelter index page", type: :feature do
  it "can link to a new shelter page" do

    visit "/shelters"
    click_link ("Create A New Shelter")

    expect(current_path).to eq("/shelters/new")
  end
end