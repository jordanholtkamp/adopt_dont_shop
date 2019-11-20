require 'rails_helper'

RSpec.describe "shelter id page", type: :feature do
  it "can see shelter by id" do
    shelter_1 = Shelter.create(name: "Some Shelter", address: "123 Who Cares Lane", city: "Houston", state: "TX", zip: 77014)
    shelter_2 = Shelter.create(name: "Another Shelter", address: "1555 Apple Road", city: "Denver", state: "CO", zip: 80211)

require "pry"; binding.pry
    visit "shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
  end
end