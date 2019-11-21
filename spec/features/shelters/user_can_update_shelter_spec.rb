require 'rails_helper'

describe 'as a visitor', type: :feature do
  describe 'when I am on the show page' do
    it 'can see and click a link to update the shelter' do
      otter_shelter = Shelter.create(name: "Get Otter Here", address: "789 River Street", city: "Lakewood", state: "CO", zip: 80213)

      visit "/shelters/#{otter_shelter.id}"

      click_link ('Edit')

      expect(current_path).to eq("/shelters/#{otter_shelter.id}/edit")

      expect(page).to have_field(:name)
      expect(page).to have_field(:address)
      expect(page).to have_field(:city)
      expect(page).to have_field(:state)
      expect(page).to have_field(:zip)

      fill_in 'name', with: 'Otter Space'

      click_button ('Update')

      expect(page).to have_content('Otter Space')
      expect(page).to have_no_content('Get Otter Here')
      expect(current_path).to eq("/shelters/#{otter_shelter.id}")
    end
  end
end
