require 'rails_helper'

describe 'as a visitor' do
  describe 'when I am on the shelter index page' do
    before :each do
      @shelter_1 = Shelter.create(name: "Some Shelter", address: "123 Who Cares Lane", city: "Houston", state: "TX", zip: 77014)
      @shelter_2 = Shelter.create(name: "Another Shelter", address: "1555 Apple Road", city: "Denver", state: "CO", zip: 80211)
    end
    it 'can show a link to update each shelter' do

      visit '/shelters'

      within "#shelter-#{@shelter_1.id}" do
        click_on 'Update'
      end

      expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
    end

    it 'can have a delete button' do

      visit '/shelters'

      within "#shelter-#{@shelter_2.id}" do
        click_on 'Delete'
      end

      expect(current_path).to eq('/shelters')
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_no_content(@shelter_2.name)
    end
  end
end