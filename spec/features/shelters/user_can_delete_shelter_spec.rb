require 'rails_helper'

describe 'as a visitor', type: :feature do
  describe "when I am on the shelter show page" do
    it "I can see a shelter delete button and delete the shelter" do
      another_kitty_shelter = Shelter.create(name: "You Cat To Be Kitten Me Right Meow", address: "987 Paw Paw Lane", city: "Denver", state: "TX", zip: 80211)
      dog_shelter = Shelter.create(name: "Im-paw-sibly Cute Dogs", address: "1287 Spot Road", city: "Austin", state: "TX", zip: 70213)

      visit "/shelters/#{dog_shelter.id}"

      click_on ("Delete Shelter")

      expect(current_path).to eq("/shelters")
      expect(page).to have_content(another_kitty_shelter.name)
      expect(page).to have_no_content(dog_shelter.name)
    end
  end
end