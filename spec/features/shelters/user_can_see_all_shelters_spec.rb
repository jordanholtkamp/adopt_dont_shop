require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters" do
    shelter_1 = Shelter.create(name: "Some Shelter", address: "123 Who Cares Lane", city: "Houston", state: "TX", zip: 77014)
    shelter_2 = Shelter.create(name: "Another Shelter", address: "1555 Apple Road", city: "Denver", state: "CO", zip: 80211)

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)

    expect(page).to have_content("Shelter: #{shelter_1.name}")
    expect(page).to have_content("Shelter: #{shelter_2.name}")
  end
end